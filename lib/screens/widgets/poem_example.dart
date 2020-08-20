import 'package:flutter/material.dart';
import 'package:yin/screens/viewmodels/poem_tune_detail.dart';

class PoemExample extends StatefulWidget {
  final PoemTuneDetail _detail;

  const PoemExample(this._detail, {Key key}) : super(key: key);

  @override
  _PoemExampleState createState() => _PoemExampleState();
}

class _PoemExampleState extends State<PoemExample> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget._detail.forms.length, vsync: this);
  }

  Widget _buildExampleView(PoemTuneTemplate template) {
    final List<TemplateLine> all = template.lines;

    return Container(
      child: ListView.builder(
          itemBuilder: (_, index) {
            final item = all[index];
            if (item == null) return Divider();
            return _buildLine(all[index].example);
          },
          itemCount: all.length),
    );
  }

  Widget _buildLine(String line) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          line,
          style: Theme.of(context).textTheme.headline6.copyWith(fontSize: 22),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            snap: false,
            pinned: true,
            iconTheme: IconThemeData(
              color: Colors.indigo,
            ),
            backgroundColor: Colors.white,
            title: Column(
              children: <Widget>[
                Text(
                  widget._detail.name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontFamily: "TW-Kai",
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.1), BlendMode.dstATop),
                  image: AssetImage("assets/images/old_1.jpg"),
                )),
                child: Padding(
                  padding: const EdgeInsets.only(top: 80, left: 8, right: 8),
                  child: Text(
                    widget._detail.description,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
            bottom: _createTab(),
          ),
        ];
      },
      body: Container(
        child: TabBarView(
          controller: _tabController,
          children: widget._detail.forms.map((e) => _buildExampleView(e.templateObject)).toList(),
        ),
      ),
    );
  }

  TabBar _createTab() {
    return TabBar(
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.indigo,
      indicatorColor: Colors.indigo,
      controller: _tabController,
      tabs: widget._detail.forms
          .map((e) => Tab(
                text: e.author,
              ))
          .toList(),
    );
  }
}
