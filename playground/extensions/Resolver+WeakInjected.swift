import Resolver

fileprivate final class WeakObject<T: AnyObject> {
    private (set) weak var value: T?
    
    init(_ v: T) {
        value = v
    }
}

@propertyWrapper
public struct WeakInjected<Service> where Service: AnyObject {
    private var weakObjectService: WeakObject<Service>
    
    public init() {
        self.weakObjectService = WeakObject(Resolver.resolve(Service.self))
    }
    
    public init(name: String? = nil, container: Resolver? = nil) {

        self.weakObjectService =
            WeakObject(container?.resolve(Service.self, name: name) ?? Resolver.resolve(Service.self, name: name))
    }
    
    public var wrappedValue: Service? {
        get { return weakObjectService.value }
        mutating set {
            if let newValue = newValue {
                weakObjectService = WeakObject(newValue)
            }
            
        }
    }
    
    public var projectedValue: WeakInjected<Service> {
        get { return self }
        mutating set { self = newValue }
    }
    
}
