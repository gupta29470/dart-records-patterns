void main(List<String> arguments) {
  // createRecord();

  // (Person?, String) response = getResponse(205);
  // print("${response.$1?.name} ${response.$2}"); // Aakash Success
  // (Person?, String) response = getResponse(305);
  // print("${response.$1?.name} ${response.$2}"); // null Failure

  // Future<(AsyncPerson?, String)> asyncResponse =
  //     getAsyncResponseAndNewSwitch(200);
  // asyncResponse.then(
  //   (value) {
  //     print("${value.$1?.name} ${value.$2}"); // Aakash Success
  //   },
  // );
  // Future<(AsyncPerson?, String)> asyncResponse =
  //     getAsyncResponseAndNewSwitch(300);
  // asyncResponse.then(
  //   (value) {
  //     print("${value.$1?.name} ${value.$2}"); // null Failure
  //   },
  // );
  // Future<(AsyncPerson?, String)> asyncResponse =
  //     getAsyncResponseAndNewSwitch(508);
  // asyncResponse.then(
  //   (value) {
  //     print("${value.$1?.name} ${value.$2}"); // null Server Error
  //   },
  // );

  guardAndLogicalOperatorCase("//");
}

// 1.
void createRecord() {
  const record = (a: 1, b: false);

  print("${record.a} ${record.b}");
}

// 2. Model and String
class Person {
/*
{
  "name": "Aakash",
  "age": 24
} 
*/

  String? name;
  int? age;

  Person({
    this.name,
    this.age,
  });
  Person.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    age = json['age']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    return data;
  }
}

(Person?, String) getResponse(int statusCode) {
  if (statusCode >= 200 && statusCode < 300) {
    return (Person(name: "Aakash", age: 24), "Success");
  }
  return (null, "Failure");
}

// 2.  Async Model and String and new switch
class AsyncPerson {
/*
{
  "name": "Aakash",
  "age": 24
} 
*/

  String? name;
  int? age;

  AsyncPerson({
    this.name,
    this.age,
  });
  AsyncPerson.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    age = json['age']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    return data;
  }
}

Future<(AsyncPerson?, String)> getAsyncResponseAndNewSwitch(
    int statusCode) async {
  return switch (statusCode) {
    (final sc) when (sc >= 200 && sc < 300) => (
        AsyncPerson(name: "Aakash", age: 24),
        "Success",
      ),
    (final sc) when (sc >= 500) => (
        null,
        "Server Error",
      ),
    _ => (null, "Failure"),
  };
}

// 4. Guard case and logical operator case
void guardAndLogicalOperatorCase(String char) {
  switch (char) {
    case "//" when char.length == 2 && char[1] == "/":
      print("Skip Comment");
      break;

    case "+" || "-" || "*" || "/":
      print("Arithmetic Operator");
      break;
  }
}
