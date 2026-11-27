
// Named constructor

class MediaItem {
  String name = 'Unknow';
  String path;
  String artist = 'Unknow artist';
  String album = 'Unknow album';

  MediaItem({
    required this.path,
    required this.name,
    required this.artist,
    required this.album
  });

  MediaItem.onlyPath(this.path);
  MediaItem.withName(this.path, this.name);

}

void main(){
  final item = MediaItem.onlyPath('//download/music1.mp3');
  final item2 = MediaItem.withName('//download/abc.mp3', 'အမေ့အိမ်');

  play(item);
  play(item2);

}


void play(MediaItem item){
  print("${item.name} is playing....");
  print('Artist: ${item.artist}');
}
