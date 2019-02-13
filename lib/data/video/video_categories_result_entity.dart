class VideoCategoriesResultEntity {
	int numberOfTotalResults;
	int statusCode;
	int offset;
	int numberOfPageResults;
	int limit;
	String error;
	List<VideoCategoriesResultResult> results;
	String version;

	VideoCategoriesResultEntity({this.numberOfTotalResults, this.statusCode, this.offset, this.numberOfPageResults, this.limit, this.error, this.results, this.version});

	VideoCategoriesResultEntity.fromJson(Map<String, dynamic> json) {
		numberOfTotalResults = json['number_of_total_results'];
		statusCode = json['status_code'];
		offset = json['offset'];
		numberOfPageResults = json['number_of_page_results'];
		limit = json['limit'];
		error = json['error'];
		if (json['results'] != null) {
			results = new List<VideoCategoriesResultResult>();
			json['results'].forEach((v) { results.add(new VideoCategoriesResultResult.fromJson(v)); });
		}
		version = json['version'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['number_of_total_results'] = this.numberOfTotalResults;
		data['status_code'] = this.statusCode;
		data['offset'] = this.offset;
		data['number_of_page_results'] = this.numberOfPageResults;
		data['limit'] = this.limit;
		data['error'] = this.error;
		if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
		data['version'] = this.version;
		return data;
	}
}

class VideoCategoriesResultResult {
	String apiDetailUrl;
	VideoCategoriesResultResultsImage image;
	String siteDetailUrl;
	String deck;
	String name;
	int id;

	VideoCategoriesResultResult({this.apiDetailUrl, this.image, this.siteDetailUrl, this.deck, this.name, this.id});

	VideoCategoriesResultResult.fromJson(Map<String, dynamic> json) {
		apiDetailUrl = json['api_detail_url'];
		image = json['image'] != null ? new VideoCategoriesResultResultsImage.fromJson(json['image']) : null;
		siteDetailUrl = json['site_detail_url'];
		deck = json['deck'];
		name = json['name'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['api_detail_url'] = this.apiDetailUrl;
		if (this.image != null) {
      data['image'] = this.image.toJson();
    }
		data['site_detail_url'] = this.siteDetailUrl;
		data['deck'] = this.deck;
		data['name'] = this.name;
		data['id'] = this.id;
		return data;
	}
}

class VideoCategoriesResultResultsImage {
	String iconUrl;
	String screenLargeUrl;
	String thumbUrl;
	String tinyUrl;
	String smallUrl;
	String superUrl;
	String originalUrl;
	String screenUrl;
	String mediumUrl;
	String imageTags;

	VideoCategoriesResultResultsImage({this.iconUrl, this.screenLargeUrl, this.thumbUrl, this.tinyUrl, this.smallUrl, this.superUrl, this.originalUrl, this.screenUrl, this.mediumUrl, this.imageTags});

	VideoCategoriesResultResultsImage.fromJson(Map<String, dynamic> json) {
		iconUrl = json['icon_url'];
		screenLargeUrl = json['screen_large_url'];
		thumbUrl = json['thumb_url'];
		tinyUrl = json['tiny_url'];
		smallUrl = json['small_url'];
		superUrl = json['super_url'];
		originalUrl = json['original_url'];
		screenUrl = json['screen_url'];
		mediumUrl = json['medium_url'];
		imageTags = json['image_tags'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['icon_url'] = this.iconUrl;
		data['screen_large_url'] = this.screenLargeUrl;
		data['thumb_url'] = this.thumbUrl;
		data['tiny_url'] = this.tinyUrl;
		data['small_url'] = this.smallUrl;
		data['super_url'] = this.superUrl;
		data['original_url'] = this.originalUrl;
		data['screen_url'] = this.screenUrl;
		data['medium_url'] = this.mediumUrl;
		data['image_tags'] = this.imageTags;
		return data;
	}
}
