import Resolver

fileprivate final class WeakObject<T: AnyObject> {
    private (set) weak var value: T?
    
    init(_ v: T) {
        value = v
    }
}

@propertyWrapper
public struct LazyWeakInjected<Service> where Service: AnyObject {
    private var weakObjectService: WeakObject<Service>?
    public var container: Resolver?
    public var name: String?
    
    public init() {}
    
    public init(name: String? = nil, container: Resolver? = nil) {
        self.name = name
        self.container = container
    }
    
    public var wrappedValue: Service? {
        mutating get {
            if self.weakObjectService == nil {
                self.weakObjectService = WeakObject(container?.resolve(Service.self, name: name) ?? Resolver.resolve(Service.self, name: name))
            }
            return self.weakObjectService?.value
        }
        mutating set {
            if let newValue = newValue {
                weakObjectService = WeakObject(newValue)
            } else {
                weakObjectService = nil
            }
        }
    }
    
    public var projectedValue: LazyWeakInjected<Service> {
        get { return self }
        mutating set { self = newValue }
    }
    
}
