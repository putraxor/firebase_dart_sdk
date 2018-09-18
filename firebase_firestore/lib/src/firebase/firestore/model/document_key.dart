// File created by
// Lung Razvan <long1eu>
// on 17/09/2018
import 'package:firebase_firestore/src/firebase/firestore/model/resource_path.dart';
import 'package:firebase_firestore/src/firebase/firestore/util/assert.dart';
import 'package:quiver/collection.dart';

/// DocumentKey represents the location of a document in the Firestore database.
class DocumentKey implements Comparable<DocumentKey> {
  static const String keyFieldName = '__name__';

  static final Set<DocumentKey> emptyKeySet = TreeSet<DocumentKey>();

  /// Returns true iff the given path is a path to a document.
  static bool isDocumentKey(ResourcePath path) => path.length % 2 == 0;

  /// The path to the document.
  final ResourcePath path;

  DocumentKey._(this.path) {
    Assert.hardAssert(isDocumentKey(path), 'Not a document key path: $path');
  }

  /// Returns a document key for the empty path.
  factory DocumentKey.empty() => DocumentKey._(ResourcePath.empty);

  /// Creates and returns a new document key with the given path.
  factory DocumentKey.fromPath(ResourcePath path) => DocumentKey._(path);

  /// Creates and returns a new document key with the given segments.
  factory DocumentKey.fromSegments(List<String> segments) {
    return DocumentKey._(ResourcePath.fromSegments(segments));
  }

  /// Creates and returns a new document key using '/' to split the string into
  /// segments.
  factory DocumentKey.fromPathString(String path) {
    return DocumentKey._(ResourcePath.fromString(path));
  }

  /// Returns true iff the given path is a path to a document.
  @override
  int compareTo(DocumentKey other) => path.compareTo(other.path);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DocumentKey &&
          runtimeType == other.runtimeType &&
          path == other.path;

  @override
  int get hashCode => path.hashCode;

  @override
  String toString() => 'DocumentKey{path: $path}';
}
