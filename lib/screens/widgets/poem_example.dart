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
    return Container(
      child: _buildLines(template.sections[0]),
    );
  }

  Widget _buildLines(PoemTuneSection section) {
    return ListView.builder(
        itemBuilder: (_, index) => Text(
              section.lines[index].example,
              style: const TextStyle(fontSize: 24),
            ),
        itemCount: section.lines.length);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: 250,
            floating: true,
            snap: false,
            pinned: true,
            //backgroundColor: Colors.white,
            title: Column(
              children: <Widget>[
                Text(
                  widget._detail.name,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontFamily: "Liu",
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
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
                  image: AssetImage("assets/images/old_1.jpg"),
                )),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 80, 8, 50),
                  child: SingleChildScrollView(
                    child: Text(
                      widget._detail.description,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            bottom: TabBar(
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.indigo,
              indicatorColor: Colors.indigo,
              controller: _tabController,
              tabs: widget._detail.forms.map((e) => Tab(text: e.author)).toList(),
            ),
          )
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
}
