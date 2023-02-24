# Homebrew-Zrythm-reqs
These are the requirements for Zrythm, able to be installed with homebrew. I made this cos I was trying to build it from source, and either you'd have to
Build the stuff from source, or the tapped formula would be out of date, so like, if there's an alternative that's not me, I'll send you to that, if I've had to update something, I'll credit whoever I took it from, and If I made the tap, well, God help you


24/02/23

Ok, so it turns out that FFTW-threads actually does install with the regular homebrew formula. I don't know how I missed that, I literally saw the library files that said libfftw-threads or whatever.

What you do have to do when you're doing

        Meson build


    is pass the option

        ---Dfftw3_threads_separate=false

    Or one of the other ones like that. I'm too tired to look it up right now, so oh well

I am a complete and utter amateur, so yeah
