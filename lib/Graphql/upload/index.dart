class Upload {
  static String singleUpload = r'''
    mutation($file: Upload!,$userId:ID) {
      singleUpload(file: $file, userId:$userId){
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
    mutation($files: [Upload!]!,$userId:ID) {
      multipleUpload(files: $files,userId:$userId){
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
