# Fun With Kanji Privacy

Fun With Kanji is a lightweight Flutter app which does **not** communicate with the internet or any server.

## Local Database

It stores the learning progress of Japanese characters and the hints, user has entered, in a local database, using [Isar](https://pub.dev/packages/isar). Isar stores data in a non encrypted file on the user device.

## Backup

The app supports export and import of the database. For this the app needs access to the file system.