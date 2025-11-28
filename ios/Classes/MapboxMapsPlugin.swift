import Flutter
import UIKit
import MapboxMaps

public class MapboxMapsPlugin: NSObject, FlutterPlugin {
    private var binaryMessenger: FlutterBinaryMessenger?
    
    init(binaryMessenger: FlutterBinaryMessenger? = nil) {
        self.binaryMessenger = binaryMessenger
    }
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let instance = MapboxMapFactory(withRegistrar: registrar)
        registrar.register(instance, withId: "plugins.flutter.io/mapbox_maps")

        setupStaticChannels(with: registrar)
    }

    private static func setupStaticChannels(with registrar: FlutterPluginRegistrar) {
        let binaryMessenger = registrar.messenger()

        let mapboxOptionsController = MapboxOptionsController(assetKeyLookup: registrar.lookupKey(forAsset:))
        let snapshotterInstanceManager = SnapshotterInstanceManager(binaryMessenger: binaryMessenger)
        let offlineMapInstanceManager = OfflineMapInstanceManager(binaryMessenger: binaryMessenger)

        _MapboxOptionsSetup.setUp(binaryMessenger: binaryMessenger, api: mapboxOptionsController)
        _MapboxMapsOptionsSetup.setUp(binaryMessenger: binaryMessenger, api: mapboxOptionsController)
        _SnapshotterInstanceManagerSetup.setUp(binaryMessenger: binaryMessenger, api: snapshotterInstanceManager)
        _OfflineMapInstanceManagerSetup.setUp(binaryMessenger: binaryMessenger, api: offlineMapInstanceManager)
        _TileStoreInstanceManagerSetup.setUp(binaryMessenger: binaryMessenger, api: offlineMapInstanceManager)
        _OfflineSwitchSetup.setUp(binaryMessenger: binaryMessenger, api: OfflineSwitch.shared)
        // LoggingController.setup(binaryMessenger)
        
        registrar.publish(MapboxMapsPlugin(binaryMessenger:binaryMessenger))
    }


    
    public func detachFromEngine(for registrar: any FlutterPluginRegistrar) {
        guard let messenger = binaryMessenger else { return }
        _MapboxOptionsSetup.setUp(binaryMessenger: messenger, api: nil)
        _MapboxMapsOptionsSetup.setUp(binaryMessenger: messenger, api: nil)
        _SnapshotterInstanceManagerSetup.setUp(binaryMessenger: messenger, api: nil)
        _OfflineMapInstanceManagerSetup.setUp(binaryMessenger: messenger, api: nil)
        _TileStoreInstanceManagerSetup.setUp(binaryMessenger: messenger, api: nil)
        _OfflineSwitchSetup.setUp(binaryMessenger: messenger, api: nil)
        binaryMessenger = nil
    }
}
