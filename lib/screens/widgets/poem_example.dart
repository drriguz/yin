import 'package:flutter/material.dart';
import 'package:yin/screens/viewmodels/poem_tune_detail.dart';

class PoemExample extends StatefulWidget {
  final PoemTuneDetail _detail;

  const PoemExample(this._detail, {Key key}) : super(key: key);

  @override
  _PoemExampleState createState() => _PoemExampleState();
}

class _PoemExampleState extends State<PoemExample>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget._detail.forms.length + 1, vsync: this);
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
            expandedHeight: 250,
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
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.1), BlendMode.dstATop),
                  image: AssetImage("assets/images/old_1.jpg"),
                )),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 96,
                      height: 96,
                      margin: const EdgeInsets.only(
                        left: 8,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://gss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/baike/whfpf%3D806%2C806%2C0/sign=c26609456359252da3424e4452a63b0b/78310a55b319ebc4acda9dc68126cffc1f1716ca.jpg")),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "李白（701年－762年） ，字太白，号青莲居士，又号“谪仙人”，唐代伟大的浪漫主义诗人，被后人誉为“诗仙”，与杜甫并称为“李杜”，为了与另两位诗人李商隐与杜牧即“小李杜”区别，杜甫与李白又合称“大李杜”。据《新唐书》记载，李白为兴圣皇帝李暠九世孙，与李唐诸王同宗。其人爽朗大方，爱饮酒作诗，喜交友。",
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
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
          children: <Widget>[
            Container(
              child: Text(widget._detail.description),
            ),
            ...widget._detail.forms
                .map((e) => _buildExampleView(e.templateObject))
                .toList()
          ],
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
      tabs: <Tab>[
        Tab(
          text: "简介",
          icon: Icon(Icons.info_outline),
        ),
        ...widget._detail.forms
            .map((e) => Tab(
                  icon: Icon(Icons.person_outline),
                  text: e.author,
                ))
            .toList()
      ],
    );
  }
}
