import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import '../components/drawer.dart';
import '../components/options.dart';

class CreatorsPage extends StatefulWidget {
  const CreatorsPage({super.key, required this.title, required this.userInfo});
  final String title;
  final dynamic userInfo;
  @override
  State<CreatorsPage> createState() => _CreatorsPageState();
}

class _CreatorsPageState extends State<CreatorsPage> {
  final ButtonStyle btnstyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  );
  final double _buttonPadding = 8;
  bool _newSeriesFormVisible = false;
  void _showNewSeriesForm() {
    setState(() {
      _newSeriesFormVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(widget.title),
      ),
      drawer: MyDrawerWidget(userInfo: widget.userInfo),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (_newSeriesFormVisible) Expanded(child:NewSeriesForm()),
            !_newSeriesFormVisible
                ? Container(
                    padding: EdgeInsets.all(_buttonPadding),
                    child: ElevatedButton(
                      style: btnstyle,
                      onPressed: _showNewSeriesForm,
                      child: const Text("Create New Series"),
                    ),
                  )
                : Container(),
            _newSeriesFormVisible
                // ? Container(
                //     padding: EdgeInsets.all(_buttonPadding),
                //     child: ElevatedButton(
                //       style: btnstyle,
                //       onPressed: () {},
                //       child: const Text("Edit Existing Series Instead"),
                //     ),
                //   )
                ? Container()
                : Container(
                    padding: EdgeInsets.all(_buttonPadding),
                    child: ElevatedButton(
                      style: btnstyle,
                      onPressed: () {},
                      child: const Text("Edit Existing Series"),
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: OptionsWidget(
        userInfo: widget.userInfo,
        addedPadding: 40,
      ),
    );
  }
}

class NewSeriesForm extends StatefulWidget {
  const NewSeriesForm({super.key});
  @override
  State<NewSeriesForm> createState() => _NewSeriesFormState();
}

class _NewSeriesFormState extends State<NewSeriesForm> {
  var elements = {
    "Spell Cards": false,
    "Adversaries": false,
    "NPC Questgivers": false,
    "Potions": false,
    "Charms": false,
    "Grown Items": false,
    "Mined Items": false,
    "Crafted Items": false,
  };

  int _page = 1;
  // Number of pages in the form, which changes depending upon the number of series elements.
  int _numPages = 3;

  void _nextPage() {
    setState(() {
      _page++;
    });
  }

  void _prevPage() {
    setState(() {
      _page--;
    });
  }

  String _seriesName = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle btnstyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );

    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Create New Series:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            _seriesName.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      '$_seriesName',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontStyle: FontStyle.italic),
                    ),
                  )
                : Container(),
            _page == 1
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Name of Series',
                          ),
                          onChanged: (String? value) {
                            _seriesName = '$value';
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Series Description',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Add Series Elements",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      Text(
                        "These are shared elements that can be used across all stories in this series. You will be able to specify these in the next steps.",
                        textAlign: TextAlign.center,
                      ),
                      ListView(
                        primary: false,
                        shrinkWrap: true,
                        children: <Widget>[
                          for (var e = 0; e < elements.keys.length; e++)
                            CheckboxListTile(
                              title: Text(elements.keys.elementAt(e)),
                              value: elements[elements.keys.elementAt(e)],
                              onChanged: (bool? value) {
                                setState(() {
                                  elements[elements.keys.elementAt(e)] = value!;
                                  _numPages =
                                      3 +
                                      elements.values
                                          .where((x) => x == true)
                                          .length;
                                });
                              },
                            ),
                        ],
                      ),
                    ],
                  )
                : _page == 2
                ? // and some other stuff too, since we have to keep track of which page it would be.
                  Column()
                : Container(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _page > 1
                    ? Padding(
                        padding: EdgeInsets.all(20),
                        child: ElevatedButton(
                          onPressed: _prevPage,
                          style: btnstyle,
                          child: Text("<< Previous"),
                        ),
                      )
                    : Container(),
                _page < _numPages
                    ? Padding(
                        padding: EdgeInsets.all(20),
                        child: ElevatedButton(
                          onPressed: _nextPage,
                          style: btnstyle,
                          child: Text("Next >>"),
                        ),
                      )
                    : Container(),
              ],
            ),
            _page == 1 ? Container() : Text('Page $_page of $_numPages'),
          ],
        ),
      ),
    );
  }
}
