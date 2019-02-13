import 'package:fimber/fimber.dart';

class VideoEntity {
	int numberOfTotalResults;
	int statusCode;
	int offset;
	int numberOfPageResults;
	int limit;
	String error;
	List<VideoResult> results;
	String version;

	VideoEntity({this.numberOfTotalResults, this.statusCode, this.offset, this.numberOfPageResults, this.limit, this.error, this.results, this.version});

	VideoEntity.fromJson(Map<String, dynamic> json) {
		Fimber.d("parsing [$json]");
		numberOfTotalResults = json['number_of_total_results'];
		statusCode = json['status_code'];
		offset = json['offset'];
		numberOfPageResults = json['number_of_page_results'];
		limit = json['limit'];
		error = json['error'];
		if (json['results'] != null) {
			results = new List<VideoResult>();
			json['results'].forEach((v) { results.add(new VideoResult.fromJson(v)); });
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

class VideoResult {
	List<VideoResultsAssociation> associations;
	String highUrl;
	String lowUrl;
	VideoResultsImage image;
	Null savedTime;
	String siteDetailUrl;
	String deck;
	String hdUrl;
	int lengthSeconds;
	String youtubeId;
	String url;
	String videoType;
	String embedPlayer;
	VideoResultsVideoShow videoShow;
	String apiDetailUrl;
	bool premium;
	String name;
	String guid;
	int id;
	List<VideoResultsVideoCategory> videoCategories;
	String publishDate;
	String user;

	VideoResult({this.associations, this.highUrl, this.lowUrl, this.image, this.savedTime, this.siteDetailUrl, this.deck, this.hdUrl, this.lengthSeconds, this.youtubeId, this.url, this.videoType, this.embedPlayer, this.videoShow, this.apiDetailUrl, this.premium, this.name, this.guid, this.id, this.videoCategories, this.publishDate, this.user});

	VideoResult.fromJson(Map<String, dynamic> json) {
		if (json['associations'] != null) {
			associations = new List<VideoResultsAssociation>();
			json['associations'].forEach((v) { associations.add(new VideoResultsAssociation.fromJson(v)); });
		}
		highUrl = json['high_url'];
		lowUrl = json['low_url'];
		image = json['image'] != null ? new VideoResultsImage.fromJson(json['image']) : null;
		savedTime = json['saved_time'];
		siteDetailUrl = json['site_detail_url'];
		deck = json['deck'];
		hdUrl = json['hd_url'];
		lengthSeconds = json['length_seconds'];
		youtubeId = json['youtube_id'];
		url = json['url'];
		videoType = json['video_type'];
		embedPlayer = json['embed_player'];
		videoShow = json['video_show'] != null ? new VideoResultsVideoShow.fromJson(json['video_show']) : null;
		apiDetailUrl = json['api_detail_url'];
		premium = json['premium'];
		name = json['name'];
		guid = json['guid'];
		id = json['id'];
		if (json['video_categories'] != null) {
			videoCategories = new List<VideoResultsVideoCategory>();
			json['video_categories'].forEach((v) { videoCategories.add(new VideoResultsVideoCategory.fromJson(v)); });
		}
		publishDate = json['publish_date'];
		user = json['user'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.associations != null) {
      data['associations'] = this.associations.map((v) => v.toJson()).toList();
    }
		data['high_url'] = this.highUrl;
		data['low_url'] = this.lowUrl;
		if (this.image != null) {
      data['image'] = this.image.toJson();
    }
		data['saved_time'] = this.savedTime;
		data['site_detail_url'] = this.siteDetailUrl;
		data['deck'] = this.deck;
		data['hd_url'] = this.hdUrl;
		data['length_seconds'] = this.lengthSeconds;
		data['youtube_id'] = this.youtubeId;
		data['url'] = this.url;
		data['video_type'] = this.videoType;
		data['embed_player'] = this.embedPlayer;
		if (this.videoShow != null) {
      data['video_show'] = this.videoShow.toJson();
    }
		data['api_detail_url'] = this.apiDetailUrl;
		data['premium'] = this.premium;
		data['name'] = this.name;
		data['guid'] = this.guid;
		data['id'] = this.id;
		if (this.videoCategories != null) {
      data['video_categories'] = this.videoCategories.map((v) => v.toJson()).toList();
    }
		data['publish_date'] = this.publishDate;
		data['user'] = this.user;
		return data;
	}
}

class VideoResultsAssociation {
	String apiDetailUrl;
	String siteDetailUrl;
	String name;
	String guid;
	int id;

	VideoResultsAssociation({this.apiDetailUrl, this.siteDetailUrl, this.name, this.guid, this.id});

	VideoResultsAssociation.fromJson(Map<String, dynamic> json) {
		apiDetailUrl = json['api_detail_url'];
		siteDetailUrl = json['site_detail_url'];
		name = json['name'];
		guid = json['guid'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['api_detail_url'] = this.apiDetailUrl;
		data['site_detail_url'] = this.siteDetailUrl;
		data['name'] = this.name;
		data['guid'] = this.guid;
		data['id'] = this.id;
		return data;
	}
}

class VideoResultsImage {
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

	VideoResultsImage({this.iconUrl, this.screenLargeUrl, this.thumbUrl, this.tinyUrl, this.smallUrl, this.superUrl, this.originalUrl, this.screenUrl, this.mediumUrl, this.imageTags});

	VideoResultsImage.fromJson(Map<String, dynamic> json) {
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

class VideoResultsVideoShow {
	String apiDetailUrl;
	VideoResultsVideoShowImage image;
	String siteDetailUrl;
	int id;
	int position;
	String title;

	VideoResultsVideoShow({this.apiDetailUrl, this.image, this.siteDetailUrl, this.id, this.position, this.title});

	VideoResultsVideoShow.fromJson(Map<String, dynamic> json) {
		apiDetailUrl = json['api_detail_url'];
		image = json['image'] != null ? new VideoResultsVideoShowImage.fromJson(json['image']) : null;
		siteDetailUrl = json['site_detail_url'];
		id = json['id'];
		position = json['position'];
		title = json['title'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['api_detail_url'] = this.apiDetailUrl;
		if (this.image != null) {
      data['image'] = this.image.toJson();
    }
		data['site_detail_url'] = this.siteDetailUrl;
		data['id'] = this.id;
		data['position'] = this.position;
		data['title'] = this.title;
		return data;
	}
}

class VideoResultsVideoShowImage {
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

	VideoResultsVideoShowImage({this.iconUrl, this.screenLargeUrl, this.thumbUrl, this.tinyUrl, this.smallUrl, this.superUrl, this.originalUrl, this.screenUrl, this.mediumUrl, this.imageTags});

	VideoResultsVideoShowImage.fromJson(Map<String, dynamic> json) {
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

class VideoResultsVideoCategory {
	String apiDetailUrl;
	String siteDetailUrl;
	String name;
	int id;

	VideoResultsVideoCategory({this.apiDetailUrl, this.siteDetailUrl, this.name, this.id});

	VideoResultsVideoCategory.fromJson(Map<String, dynamic> json) {
		apiDetailUrl = json['api_detail_url'];
		siteDetailUrl = json['site_detail_url'];
		name = json['name'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['api_detail_url'] = this.apiDetailUrl;
		data['site_detail_url'] = this.siteDetailUrl;
		data['name'] = this.name;
		data['id'] = this.id;
		return data;
	}
}
