import 'dart:developer';

main()  async {

  Stream<int> countStream(int max) async* {
    for (int i = 0; i < max; i++) {
      yield i;
    }
  }


 await countStream(10).listen((dd){
    print(dd);
  });

//
//  await for (int value in countStream(10)) {
//    print(value);
//  }

  /// Print the sum
}