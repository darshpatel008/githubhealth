
import 'dart:ui';

class modelclass {
  int? id;
  String? name;
  String? description;
  String? images;
  bool? hasSlotSelection;
  List<int>? slot;
  modelclass(
      {this.id, this.name, this.hasSlotSelection, this.slot, this.description,this.images});

  // Convert an IntListModel instance to a JSON object

  modelclass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    images = json['images'];
    description = json['description'];
    hasSlotSelection = json['hasSlotSelection'];
    // slot = List<int>.from(json['slot']);
    if (json['slot'] != null) {
      slot = <int>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['images'] = this.images;
    data['description'] = this.description;
    data['name'] = this.name;
    data['hasSlotSelection'] = this.hasSlotSelection;
    data['slot'] = this.slot;
    return data;
  }
}