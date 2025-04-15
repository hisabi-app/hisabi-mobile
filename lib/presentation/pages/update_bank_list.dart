import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateBankList extends StatefulWidget {
  final route = MaterialPageRoute(builder: (context) => UpdateBankList());

  UpdateBankList({super.key, this.sendersDropDownItems});
  final sendersDropDownItems;

  @override
  State<UpdateBankList> createState() => _UpdateBankListState();
}

class _UpdateBankListState extends State<UpdateBankList> {
  String? _selectedBank;
  List<String> _listOfBanks = [];

  @override
  void initState() {
    super.initState();
    _selectedBank = "";
    print(context.read<AppCubit>().state.token);
    if (context.read<AppCubit>().state.listOfBanks.isEmpty) {
      _listOfBanks = [];
    } else {
      _listOfBanks = context.read<AppCubit>().state.listOfBanks;
    }
  }

  Future updateSharedPrefs(listOfBanks) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setStringList("listOfBanks", _listOfBanks);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.2,
          ),
          Row(
            children: [
              DropdownButton(
                  items: widget.sendersDropDownItems,
                  onChanged: (value) {
                    setState(() {
                      _selectedBank = value.toString();
                    });
                  }),
              TextButton(
                  onPressed: () {
                    final oldState = context.read<AppCubit>().state;
                    setState(() {
                      _listOfBanks.add(_selectedBank!);
                    });
                    context.read<AppCubit>().updateState(
                        oldState.copyWith(listOfBanks: _listOfBanks));
                    updateSharedPrefs(_listOfBanks);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text("Add bank")),
            ],
          ),
          SizedBox(
            height: height * 0.2,
          ),
          SingleChildScrollView(
            child: Column(
              children: _listOfBanks.map((e) {
                return Text(e);
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
