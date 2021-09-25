# CacheX for Flutter

A feasible caching package for Flutter. Save any data encrypted.

> Inspired by [CacheX for Android](https://github.com/rommansabbir/CacheX)

## How does it work ?

| Caching is just a simple key-value pair data saving procedure. CacheX follows the same approach. CacheX uses SharedPreference as storage for caching data. Since we really can't just save the original data because of security issues. CacheX uses `AES` encryption & decryption behind the scene when you are caching data or fetching data from the cache.|
| --- |

## Screenshot from the [Example Project](https://pub.dev/packages/cache_x/example) after using [CacheX](https://pub.dev/packages/cache_x)

<img src="https://github.com/FTKhanFT/Cache_X/blob/main/lib/screenshot.png?raw=true"/>

## Getting Started

First you have to add the package dependency in `pubspec.yml`

    cache_x: ^latest
Get the version from [pub.dev](https://pub.dev/packages/cache_x)

### In the `main Function` of your App

    void main() async {
        WidgetsFlutterBinding.ensureInitialized();

        // Initialize password
        // Passowrd length must be 128/192/256 bits
        // you can use the password of 16 character,24 character or 32 character.
        String password = 'CBoaDQIQAgceGg8dFAkMDBEOECEZCxg=';

        // Initialize CacheX with the password
        await CacheXCore().init(password: password);

        // Do your apps essential works

        // Then anywhere in your app use it to save string
        await CacheXCore.instance.saveString(key: 'ft1', value: 'Tanvir');
        // Get String
        await CacheXCore.instance.getString(key: 'ft1');
    }

Also you can save the instance in a variable then use the variable to save or get any data.

    // CacheXCore type of variable cacheX
    final cacheX = CacheXCore();

    // Init the CacheX
    await cacheX.init(password: password);

    // Save bool
    cacheX.saveBool(key: 'dark', value: true);

    // Get bool
    cacheX.getBool(
      key: 'dark',
      defaultValue: false,
    );

| ⚠ WARNING: If you forget or lost the specified password all the data encrypted with the password will be unusable. |
| --- |

## Parse Server

If tou are using [parse_server_sdk_flutter](https://pub.dev/packages/parse_server_sdk_flutter) in your project you can use CacheX as default coreStore.

Once you have the library added to your project, when you initialize [parse_server_sdk_flutter](https://pub.dev/packages/parse_server_sdk_flutter) sdk add the CoreStoreCacheXImpl in coreStore...

    import 'package:cache_x/core_store_cacheX_impl.dart';
    await Parse().initialize(
        appId,
        serverUrl,
        clientKey: clientKey,
        liveQueryUrl: serverUrl,
        coreStore: await CoreStoreCacheXImpl.getInstance(
          password: 'u0TCHVOIiEFVwOqqDo1OnLfd3Kx7yaRt',
        ),
        debug: true,
        autoSendSessionId: true,
      );

## Available Methods

- Save Methods
  - saveBool(String key, bool value)
  - saveDouble(String key, double value)
  - saveInt(String key, int value)
  - saveString(String key, String value)
  - saveStringList(String key, List\<String> value)
  
- Get Methods
  - getBool(String key)
  - getDouble(String key)
  - getInt(String key)
  - getString(String key)
  - getStringList(String key)
  - getKeys()
  - containsKey(String key)
- Remove Methods
  - remove(String key)
  - clear()

## Important things to keep in mind

- The password must be 128/192/256 bits. It means the password only can be `16` character,`24` character or `32` character in length. Otherwise it will throw exception.
- Provide `defaultValue` in the get methods or else the default value will be null. If the key is not found or the data is not the right type it return the `defaultValue`.
- All the `save` methods will return `Future<bool>` so to get the value you have to use `await`
- It will throw [exception](#exceptions-in-the-package) if there any.

## Exceptions in the Package

- CacheXException
  - If there any exception in the CacheXCore or the CacheXCore is not initialized properly it will throw `CacheXException` exception. The exception message starts with `CacheXException:`.
- StorageException
  - If there any exception saving or getting data it will throw `StorageException`. The exception message starts with String `StorageException:`.
- EncryptionException
  - If there any exception encrypting or decrypting the data it will throw `EncryptionException`. The exception message will start with String `EncryptionException:`.

## Other Projects

[TransitionX](https://pub.dev/packages/transition_x), [Rounded Button](https://pub.dev/packages/rounded_button), [CacheX](https://pub.dev/packages/cache_x)
