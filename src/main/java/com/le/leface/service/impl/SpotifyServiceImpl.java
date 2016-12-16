package com.le.leface.service.impl;

import org.springframework.stereotype.Service;

import com.le.leface.service.SpotifyService;
import com.wrapper.spotify.Api;
import com.wrapper.spotify.methods.TrackSearchRequest;
import com.wrapper.spotify.models.Page;
import com.wrapper.spotify.models.Track;

@Service
public class SpotifyServiceImpl implements SpotifyService {

	private static Api api = Api.DEFAULT_API;
	
	@Override
	public String searchFirstTrackId(String keyword) {
		final TrackSearchRequest request = api.searchTracks(keyword).market("US").build();

		try {
		   final Page<Track> trackSearchResult = request.get();
		   if (trackSearchResult.getTotal() == 0) return null;
		   return trackSearchResult.getItems().get(0).getId();
		} catch (Exception e) {
		   e.printStackTrace();
		}
		
		return null;
	}

	public static void main(String[] args) {
		SpotifyServiceImpl spotifyServiceImpl = new SpotifyServiceImpl();
		System.out.println(spotifyServiceImpl.searchFirstTrackId("Wild Ones feat Sia"));
	}
}
