import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Card(
                elevation: 0,
                child: const Text(
                  'Add Your card here: ',
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),

              /* 
              Container(
                margin: EdgeInsets.all(14),
                //make the container height 1/3 of the screen
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red.shade200),
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
              ),

              */
              Container(
                padding: const EdgeInsets.only(
                    left: 18, right: 18, top: 22, bottom: 160),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Theme.of(context).cardColor,
                  // color: const Color(0xffF1F3F6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Add your Card card here',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Enter your 16 Digit number',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        SizedBox(height: 27),
                        Text('__ __ __ __ __ __ __ __ __ __ __ __ __ __ __ __'),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFAC30),
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: Center(
                        child: MaterialButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed('/CardPage'),
                          child: Icon(
                            Icons.add,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
