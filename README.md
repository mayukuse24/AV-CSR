# AV-CSR

## Prerequisites

- sCASP [Install from here](https://gitlab.software.imdea.org/ciao-lang/sCASP)

## How to run

1. Execute scasp in iterative mode

```
scasp -i main_scasp.pl --prev_forall
```

2. Run query start_drive(\<Initial Frame No.\>, \<Final Frame No.\>) to process all frames in the range. For example

```
start_drive(1, 12). % Runs program from 1st frame to the 11th frame
```

## What is a frame?

A frame represents a set of facts at a given timestamp T, that defines the environment for the AV. For e.g. it may
describe the vehicles that are around the AV, traffic lights, traffic signs, no. of lanes etc at the given timestamp T

See `template.pl` inside the `scenarios_scasp` folder to get an idea of what facts are defined for a frame and how to use
interpet/use them

## Select scenario

Example scenarios are available in folder `scenarios_scasp`. Rename scenario file path in the `\#include` directive
in the `main_scasp.pl` file to run program on selected scenario

## KITTI samples

Representative KITTI frames mentioned in paper is under `scenarios_scasp/kitti` folder

## Generating proof tree

Start scasp iterative mode with command flags `--tree`, `--human` or `--html` to generate proof trees for
particular execution


