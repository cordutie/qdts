## Patches

The files `carrierfreqgen.maxpat`, `sinusoid.maxpat` and `synth.maxpat` are subpatches
used to manage the large amounts of sinusoids needed to generate QDTS. The files `4eq.maxpat`,
`8eq.maxpat`, `12eq.maxpat` and `16eq.maxpat` are subpatches that can be used to compute **QDTS**
consisting in 4, 8, 12 and 16 harmonics respectively. This subpatches were made in a way that
when loaded using the `bpatcher` object, a simple but functional GUI is shown, whose main purpose
is to make the usage of the external as simple as possible. Finally, the patch `main.maxpat`
is an example patch that loads the subpatch `8eq.maxpat` using the `bpatcher` object.
