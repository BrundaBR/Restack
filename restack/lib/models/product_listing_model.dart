class ProductForListing {
  String post_id;
  String username;
  String product_image;
  String product_name;
  String product_description;
  DateTime timeline_from_date;
  DateTime timeline_to_date;

  ProductForListing({
    this.post_id,
    this.username,
    this.product_description,
    this.product_image,
    this.product_name,
    this.timeline_from_date,
    this.timeline_to_date
  });
}
