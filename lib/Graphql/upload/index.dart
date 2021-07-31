class Upload {
  static String singleUpload = r'''
    mutation($file: Upload!, $directory: String) {
      singleUpload(file: $file, directory: $directory){
        id
        name
        url
        mime
        ext
        size
      }
    }
  ''';
  static String multipleUpload = r'''
    mutation($files: [Upload!]!, $directory: String) {
      multipleUpload(files: $files, directory:$directory){
        id
        name
        url
        mime
        ext
        size
      }
    }
  ''';

  static String removeUpload = r'''
    mutation($id: ID!) {
      removeUpload(id: $id)
    }
  ''';
}
