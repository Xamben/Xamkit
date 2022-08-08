//
//  Builder+Variable.swift
//  ViewBuilder
//
//  Created by Michael Long on 10/23/21.
//

import Foundation
import RxSwift
import RxCocoa

public protocol RxBinding {
    associatedtype T
    func asObservable() -> Observable<T>
}

extension Observable: RxBinding {
    // previously defined
}

public protocol RxBidirectionalBinding: RxBinding {
    associatedtype T
    func asRelay() -> BehaviorRelay<T>
}

extension BehaviorRelay: RxBidirectionalBinding {
    public func asRelay() -> BehaviorRelay<Element> { self }
}

@propertyWrapper public struct Variable<T> {
    
    private var relay: BehaviorRelay<T>
    
    public init(_ relay: BehaviorRelay<T>) {
        self.relay = relay
    }
    
    public var wrappedValue: T {
        get { return relay.value }
        nonmutating set { relay.accept(newValue) }
    }
    
    public var projectedValue: Variable<T> {
        get { return self }
    }
    
}

extension Variable {
    
    public init(wrappedValue: T) {
        self.relay = BehaviorRelay<T>(value: wrappedValue)
    }
    
}

extension Variable where T:Equatable {
    
    public func onChange(_ observer: @escaping (_ value: T) -> ()) -> Disposable {
        relay
            .skip(1)
            .distinctUntilChanged()
            .subscribe { observer($0) }
    }

}

extension Variable: RxBinding {
    
    public func asObservable() -> Observable<T> {
        return relay.asObservable()
    }
    
    public func observe(on scheduler: ImmediateSchedulerType) -> Observable<T> {
        return relay.observe(on: scheduler)
    }
    
    public func bind(_ observable: Observable<T>) -> Disposable {
        return observable.bind(to: relay)
    }
        
}

extension Variable: RxBidirectionalBinding {
    public func asRelay() -> BehaviorRelay<T> {
        return relay
    }
    
}
