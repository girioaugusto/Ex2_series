import 'package:app2_series/rating_widget.dart';
import 'package:app2_series/tv_show_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TvShowCard extends StatelessWidget {
  const TvShowCard({
    super.key,
    required this.tvShow,
    required this.index,
    //required this.removeTvShow,
  });

  final TvShow tvShow;
  final int index;
  //final Function(TvShow) removeTvShow;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 18,
        ),
        leading: CircleAvatar(
          backgroundColor: colorScheme.primary,
          child: Text(
            (index + 1).toString(),
            style: GoogleFonts.lobster(
              color: colorScheme.secondaryContainer,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          tvShow.title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          tvShow.stream,
          style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
        ),
        trailing: ratingWidget(number: tvShow.rating),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(tvShow.title),
                  IconButton.outlined(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.close, size: 32),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Streaming: ${tvShow.stream}'),
                  const SizedBox(height: 10),
                  Text('Rating: ${tvShow.rating}'),
                  const SizedBox(height: 10),
                  Text(tvShow.summary),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    context.read<TvShowModel>().removeTvShow(tvShow, context);
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'REMOVER',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    final index = context.read<TvShowModel>().tvShows.indexOf(
                      tvShow,
                    );
                    Navigator.of(context).pop();
                    context.go('/edit/$index');
                  },
                  child: const Text(
                    'EDITAR',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
