import 'package:flutter/material.dart';

class Faqs extends StatefulWidget {
  const Faqs({Key? key}) : super(key: key);

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  List<Item> _data = generateItems();

  @override
  void initState() {
    super.initState();
    // Start a timer to navigate to the next screen after 5 seconds
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 25,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFF3F3F3)),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'FAQS ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      Text(
                        'Frequently asked questions ',
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromARGB(255, 159, 159, 159),
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildPanel(),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return Column(
      children: _data.map<Widget>((Item item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ExpansionPanelList(
            elevation: 1,
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                item.isExpanded = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                backgroundColor: Color(0xFFF3F3F3),
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(
                      item.headerValue,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  );
                },
                body: ListTile(
                  title: Text(
                    item.expandedValue,
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Color.fromARGB(255, 159, 159, 159),
                    ),
                  ),
                ),
                isExpanded: item.isExpanded,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems() {
  return [
    Item(
      headerValue: 'What is Xcoin?',
      expandedValue:
          'XCoin is an innovative project introducing a refreshed Tap-to-Earn feature on TON, tailored for the crypto community. With this platform, you can tap to receive USDT, a widely-used stablecoin that can be easily withdrawn, as well as xUSD, the project\'s own token that grants eligibility for airdrops. The app will soon be available not just on TON but also across various other networks.',
    ),
    Item(
      headerValue: 'How to earn USDT',
      expandedValue:
          'To start accumulating USDT, just activate the Telegram bot and tap on the screen. Telegram Premium members can earn 1 USDT per day, while non-premium users can earn 0.2 USDT each day. Moreover, you\'ll receive our native token, tUSD. Holding tUSD will make you eligible for future airdrops!',
    ),

    Item(
      headerValue: 'How to boost your earnings ?',
      expandedValue:
          'You can elevate your account with unique enhancements that increase your earnings per tap or provide passive income every hour, even when you\'re not tapping. Navigate to the “Mine” section, select your upgrade plan, and buy it to boost your income. All acquired upgrades are cumulative, so you can invest in several enhancements to maximize your profit.',
    ),
    Item(
      headerValue: 'Who can use Vortex?',
      expandedValue:
          'Anyone can make use of our service. Crypto users, Diaspora community, Remote workers and freelancers',
    ),

    Item(
      headerValue: 'How can i start using the Vortex app?',
      expandedValue:
          '1.Open and install the launch the app 2. Launch the app after visiting the telegram channel 3. Register your required bank or leave it empty to receive funds in your wallet 4.Now you are all set 5.Navigate to the asset you want to convert from the home screen and copy the provided address  6.Send asset and receive funds immediately after confirmation. ',
    ),

    Item(
      headerValue: 'Can i change my withdrawal ?',
      expandedValue: 'Yes, you can choose to change it anytime you wish.',
    ),

    Item(
      headerValue: 'At what market rate will my payment be processed?',
      expandedValue:
          'The rate which will be used for conversion will be the rate at the time of the blockchain confirmation.',
    ),

    Item(
      headerValue: 'How much can i withdraw at a time?',
      expandedValue:
          'There is no minimum or maximum amount that can be cashed out using the Vortex app. The service is constantly adapting to users needs.',
    ),

    Item(
      headerValue: 'How will i know that my transaction has been completed',
      expandedValue:
          'You will receive push notification, notifying you that the transaction has been completed. You can also check your transaction history on the Transactions section of the app.',
    ),

    Item(
      headerValue:
          'How long does it take for the funds to appear in my wallet or bank account?',
      expandedValue:
          'Within minutes. Bitcoin transactions are typically processed within an average of 10 minutes from the time of the first blockchain confirmation. Once the crypto is received in the QuickXchange app, the funds are processed immediately and sent to your preferred destination.',
    ),
    // Add more items here as needed
  ];
}
