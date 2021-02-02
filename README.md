# CacheX for Flutter

##### A feasible caching library for Flutter. Save any encrypted string.

> Inspired by [CacheX for Android](https://github.com/rommansabbir/CacheX)

## How does it work ?

Caching is just a simple key-value pair data saving procedure. CacheX follows the same approach. CacheX uses SharedPreference as storage for caching data. Since we really can't just save the original data because of security issues. CacheX uses AES encryption & decryption behind the scene when you are caching data or fetching data from the cache.

## Getting Started

First you have to add the package dependency in ```pubspec.yml```

    cache_x: ^latest
Get the version from [pub.dev](https://pub.dev/packages/cache_x)

### In the main Function of your Flutter app

    void main() async {
        WidgetsFlutterBinding.ensureInitialized();

        // Initialize 128byte password (16 character)
        String password = 'CBoaDQIQAgceGg8d';

        // Initialize CacheX with the password
        await CacheXCore().init(password);

        // Do your apps essential works

        // Then anywhere in your app use it to save string
        print(await CacheXCore.instance.saveData('ft1', 'Tanvir'));
        // Get String
        print(await CacheXCore.instance.getData('ft1'));
    }

```CacheXCore.instance.saveData(String key, String value)``` will return ```Future<bool>``` so you have to use ```await``` to get the result of it or there any exception will throw exception.

```CacheXCore.instance.getData(String key)``` will return ```Future<String>``` so to get the string you have to use ```await``` and it will throw exception if there any.

## Other Projects

[TransitionX](https://pub.dev/packages/transition_x), [Rounded Button](https://pub.dev/packages/rounded_button), [CacheX](https://pub.dev/packages/cache_x)
