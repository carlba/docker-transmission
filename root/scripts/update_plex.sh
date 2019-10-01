#!/usr/bin/env bash

# Test
# PLEX_URI=http://servern.local:32400 PLEX_TOKEN=dummy_token PLEX_LIBRARY_MOVIE_SECTION=1 PLEX_LIBRARY_SERIES_SECTION=2 TR_TORRENT_DIR=/series bash update_plex.sh

[[ -z "${PLEX_URI}" ]] && echo 'Please provide Plex Server URI as PLEX_URI' && exit 1
[[ -z "${PLEX_TOKEN}" ]] && echo 'Please provide Plex token as PLEX_TOKEN' && exit 1
[[ -z "${PLEX_LIBRARY_MOVIE_SECTION}" ]] && echo 'Please provide Plex Library secions as PLEX_LIBRARY_MOVIE_SECTION' && exit 1
[[ -z "${PLEX_LIBRARY_SERIES_SECTION}" ]] && echo 'Please provide Plex Library secions as PLEX_LIBRARY_SERIES_SECTION' && exit 1

[[ "${TR_TORRENT_DIR}" == *"/movies"* ]] \
  && plex_library_secion=$PLEX_LIBRARY_MOVIE_SECTION \
  && echo "Updating Plex Library Movie Section ${PLEX_LIBRARY_MOVIE_SECTION}"

[[ "${TR_TORRENT_DIR}" == *"/series"* ]] \
  && plex_library_secion=$PLEX_LIBRARY_SERIES_SECTION \
  && echo "Updating Plex Library Series Section ${PLEX_LIBRARY_SERIES_SECTION}"

if [[ -n "${plex_library_secion}" ]]; then
  curl -s -X PUT "${PLEX_URI}/library/sections/${plex_library_secion}/refresh?X-Plex-Token=${PLEX_TOKEN}"
  echo "Executing curl: curl -X PUT \"${PLEX_URI}/library/sections/${plex_library_secion}/refresh?X-Plex-Token=${PLEX_TOKEN}\""
fi
