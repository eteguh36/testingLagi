part of 'page.dart';

class PageAuthLogin extends StatefulWidget {
  const PageAuthLogin({Key? key}) : super(key: key);
  @override
  PageAuthLoginState createState() => PageAuthLoginState();
}

class PageAuthLoginState extends State<PageAuthLogin> {
  //

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ProviderAuthLogin>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: prov.user,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: prov.password,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                height: 35,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffF18265),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    prov.login(context);
                  },
                  child: Text(
                    prov.isLoading ? "Please Wait" : "Login",
                    style: const TextStyle(
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  prov.errorMsg,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
