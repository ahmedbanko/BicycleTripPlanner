import 'dart:math';

import 'package:bicycle_trip_planner/managers/DatabaseManager.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database_mocks/firebase_database_mocks.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';

/*<<<<<<< HEAD
import 'mock_firebase.dart';

void main() {

  late DatabaseManager databaseManager;
  late FirebaseAuth auth;

  const favouriteRouteId = "routeID";
  const favouriteStationsID = "158";
  const description = "description";
  const routeID = "endRouteID";
  const lat = "50.54631";
  const lng = "-0.15413";
  const name = "locationName";

  FirebaseDatabase firebaseDatabase;
  // Put fake data
  const userId = 'userId';
  const userName = 'Elon musk';
  const fakeData = {
    'users': {
      userId: {
        'favouriteRoutes': {
          favouriteRouteId: {
            'end':{
              'description':{description},
              'id':{routeID},
              'lat': {lat},
              'lng': {lng},
              'name': {name}
            },
            'start':{
              'description':{description},
              'id':{routeID},
              'lat': {lat},
              'lng': {lng},
              'name': {name}
            },
            'stops':{
              0: {
                'description':{description},
                'id':{routeID},
                'lat': {lat},
                'lng': {lng},
                'name': {name}
              }
            }
          },
          'favouriteStations': {
            favouriteStationsID: {favouriteStationsID}
          }
        }
      }
    }
  };


  setupFirebaseMocks();
  setupFirebaseAuthMocks();
  setupFirebaseDatabaseMocks();
  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();

    firebaseDatabase = MockFirebaseDatabase.instance;
    firebaseDatabase.ref().set(fakeData);
    final app = await Firebase.initializeApp(
      name: '1',
      options: const FirebaseOptions(
        apiKey: '',
        appId: '',
        messagingSenderId: '',
        projectId: '',
      ),
    );

    final googleSignIn = MockGoogleSignIn();
    final signinAccount = await googleSignIn.signIn();
    final googleAuth = await signinAccount?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final user = MockUser(
      isAnonymous: false,
      uid: userId,
      email: 'bob@somedomain.com',
      displayName: 'Bob',
    );
    auth = MockFirebaseAuth(mockUser: user);
    final result = await auth.signInWithCredential(credential);
    final loginInUser = await result.user;

    databaseManager = DatabaseManager.forMock(firebaseDatabase, auth);
  });
=======*/

Future<void> main() async {

  setupFirebaseMocks();
//>>>>>>> 70a28859dd8ba5f654840bebf080ec2b2439fcc2

  final database = MockFirebaseDatabase();
  final auth = MockFirebaseAuth();

  await Firebase.initializeApp();


/*<<<<<<< HEAD
  test('Remove favourite route', ()async{
    await databaseManager.removeFavouriteRoute(routeID);
    final stationFromFakeDatabase = await databaseManager.getFavouriteRoutes();
    expect(stationFromFakeDatabase, equals(null));
  });
=======
>>>>>>> 70a28859dd8ba5f654840bebf080ec2b2439fcc2*/

  test('Get favourite station', () async {

    final databaseManager = DatabaseManager.forMock(database, auth);
    databaseManager.isUserLogged();
    databaseManager.getFavouriteRoutes();

  });

  test("",(){

  });


  // const favouriteRouteId = "routeID";
  // const favouriteStationsID = "158";
  // const description = "description";
  // const routeID = "endRouteID";
  // const lat = "50.54631";
  // const lng = "-0.15413";
  // const name = "locationName";
  //
  // FirebaseDatabase firebaseDatabase;
  // // Put fake data
  // const userId = 'userId';
  // const userName = 'Elon musk';
  // const fakeData = {
  //   'users': {
  //     userId: {
  //       'favouriteRoutes': {
  //         favouriteRouteId: {
  //           'end':{
  //             'description':{description},
  //             'id':{routeID},
  //             'lat': {lat},
  //             'lng': {lng},
  //             'name': {name}
  //           },
  //           'start':{
  //             'description':{description},
  //             'id':{routeID},
  //             'lat': {lat},
  //             'lng': {lng},
  //             'name': {name}
  //           },
  //           'stops':{
  //             0: {
  //               'description':{description},
  //               'id':{routeID},
  //               'lat': {lat},
  //               'lng': {lng},
  //               'name': {name}
  //             }
  //           }
  //         },
  //         'favouriteStations': {
  //           favouriteStationsID: {favouriteStationsID}
  //         }
  //       }
  //     }
  //   }
  // };
  //
  // MockFirebaseDatabase.instance.ref().set(fakeData);
  // test('Get favourite station', () async {
  //   final databaseManager = DatabaseManager.forMock(database, auth);
  //   final stationFromFakeDatabase = await databaseManager.getFavouriteStations();
  //   expect(stationFromFakeDatabase.first.toString(), equals(favouriteStationsID));
  // });


  //
  // test('Get favourite routes', () async {
  //   final routeFromFakeDatabase = await databaseManager.getFavouriteRoutes();
  //   //Need to create the pathway object
  //   expect(
  //     routeFromFakeDatabase,
  //     equals(""),
  //   );
  // });
  //
  // test('Remove favourite station',() async{
  //   await databaseManager.removeFavouriteStation(favouriteStationsID);
  //   final stationFromFakeDatabase = await databaseManager.getFavouriteStations();
  //   expect(stationFromFakeDatabase, equals(null));
  // });
  //
  // test('Remove favourite route',()async{
  //   await databaseManager.removeFavouriteRoute(routeID);
  //   final stationFromFakeDatabase = await databaseManager.getFavouriteRoutes();
  //   expect(stationFromFakeDatabase, equals(null));
  // });
  //
  // test('Add favourite station',()async{
  //   final initialStationFromFakeDatabase = await databaseManager.getFavouriteStations();
  //   expect(initialStationFromFakeDatabase, equals(null));
  //
  //   await databaseManager.addToFavouriteStations(int.parse(favouriteStationsID));
  //
  //   final stationFromFakeDatabase = await databaseManager.getFavouriteStations();
  //   expect(stationFromFakeDatabase.first.toString(), equals(favouriteStationsID));
  // });
  //
  // test('Add favourite route',() async{
  //   final stationFromFakeDatabase = await databaseManager.getFavouriteRoutes();
  //   expect(stationFromFakeDatabase, equals(null));

    //await databaseManager.addToFavouriteRoutes(start, end, stops)
    //Need to add place data to create test
  //});

}