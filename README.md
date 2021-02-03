# CacheX for Flutter

A feasible caching library for Flutter. Save any encrypted string.

> Inspired by [CacheX for Android](https://github.com/rommansabbir/CacheX)

## How does it work ?

Caching is just a simple key-value pair data saving procedure. CacheX follows the same approach. CacheX uses SharedPreference as storage for caching data. Since we really can't just save the original data because of security issues. CacheX uses `AES` encryption & decryption behind the scene when you are caching data or fetching data from the cache.

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

    // Save String
    cacheX.saveString(key: 'ft1', value: 'Tanvir');

    // Get String
    cacheX.getString(key: 'ft1');

## Available Methods

- Save Methods
  - saveBool(String key, bool value)
  - saveDouble(String key, double value)
  - saveInt(String key, int value)
  - saveString(String key, String value)
  - saveStringList(String key, List<String> value)
- Get Methods
  - getBool(String key)
  - getDouble(String key)
  - getInt(String key)
  - getString(String key)
  - getStringList(String key)
  - getKeys()

## Important things to keep in mind

- The password must be 128/192/256 bits. It means the password only can be `16` character,`24` character or `32` character in length. Otherwise it will throw exception.

- All the `save` and `get` methods will return `Future<>` so to get the value you have to use `await` and it will throw [exception](#exceptions-in-the-package) if there any.

## Exceptions in the Package

- CacheXException
  - If there any exception in the CacheXCore or the CacheXCore is not initialized properly it will throw `CacheXException` exception. The exception message starts with `CacheXException:`.
- StorageException
  - If there any exception saving or getting data it will throw `StorageException`. The exception message starts with String `StorageException:`.
- EncryptionException
  - If there any exception encrypting or decrypting the data it will throw `EncryptionException`. The exception message will start with String `EncryptionException:`.

## Other Projects

[TransitionX](https://pub.dev/packages/transition_x), [Rounded Button](https://pub.dev/packages/rounded_button), [CacheX](https://pub.dev/packages/cache_x)
