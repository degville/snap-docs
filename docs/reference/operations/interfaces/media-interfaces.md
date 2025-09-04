(snap-reference-operations-interfaces-media-interfaces)=
# Media interfaces

Media [Interfaces](/snap-explanation/interfaces/all-about-interfaces) are interfaces that can either enable or disable access to system resources that handle media access, playback or recording. They include interfaces that handle audio playback, microphone access, webcam support and digital video devices.

See [Supported interfaces](/snap-reference/operations/interfaces/index) for a complete list of interfaces.

## Media interfaces

| Interface | Description | Categories | Auto-connect |
|---|----|---|---|
| [alsa](/) | play or record sound | Audio | no |
| [audio-playback](/) | allows audio playback via supporting services | Audio, Playback | yes |
| [audio-record](/) | allows audio recording via supported services | Audio, Record | no |
| [camera](/) | use your camera or webcam | Camera, Media, Personal data | no |
| [dvb](/) | allows access to all DVB devices and APIs | Hardware, Developer, Media | no |
| [jack1](/) | allows interaction with the JACK audio connection server | Audio, Media | no |
| [media-control](/t/the-media-control-interface/26504/) | access media control devices and Video4Linux (V4L) devices | Hardware, Developer, Media, Video | no |
| [media-hub](/) | access snaps providing the media-hub interface | Developer, Media | yes |
| [pulseaudio](/) | play and record sound | Audio, Media | no |

