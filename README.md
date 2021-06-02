# Riskified

Note: This library is not official from Riskified.

Flutter plugin to integrate with the Android and iOS libraries of Riskified.
https://www.riskified.com/

## Flutter implementation

**shopName** - Name of your Riskified account.

**token** - Unique String identifier of the user's current session in the app. The same identifier is passed by your backend (in the cart_tokenfield) to Riskified.

```dart
Riskified.startBeacon('shopName', 'token');
```


