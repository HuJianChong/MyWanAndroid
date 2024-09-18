///知识体系传递给明细页面参数
class KnowledgeDetailParam{

  String? name;
  String? id;

  KnowledgeDetailParam(this.name, this.id);

  @override
  String toString() {
    return 'KnowledgeDetailParam{name: $name, id: $id}';
  }
}
