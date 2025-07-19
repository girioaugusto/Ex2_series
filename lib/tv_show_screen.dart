import 'package:app2_series/tv_show_card.dart';
import 'package:flutter/material.dart';
import 'package:app2_series/tv_show_model.dart';
import 'package:provider/provider.dart';

class TvShowScreen extends StatefulWidget {
  const TvShowScreen({super.key});

  //final List<TvShow> tvShows;
  //final Function(TvShow) removeTvShow;

  @override
  State<TvShowScreen> createState() => _TvShowScreenState();
}

class _TvShowScreenState extends State<TvShowScreen> {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<TvShowModel>(context);
    //var model = context.watch<TvShowModel>(); //esse e o de cima faz a mesma coisa, quando queremos provocar uma nova reconstrução do widget

    return ListView.builder(
      itemCount: model.tvShows.length,
      itemBuilder: (context, index) => Consumer<TvShowModel>(
        builder: (context, model, child) =>
            TvShowCard(tvShow: model.tvShows[index], index: index),
      ),
    );
  }
}
