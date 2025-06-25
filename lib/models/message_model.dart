enum FromWho { me, bot }

class MessageM {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  MessageM({required this.text, this.imageUrl, required this.fromWho});
}
