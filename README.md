# Generalized Directory Structure

```
nextflow/
├── bin
├── envs
│   └── base_env.yml
├── main.nf
├── modules
├── nextflow.config
├── refs
├── results
└── samples
```

**bin/**
  - Contains all python scripts ran in nextflow

**envs/**
  - This contains all of the specification files for the individual environments used by the workflow

**main.nf/complete.nf**
- The main scripts used to call the workflow

**modules**
- Each contains a separate process that can be generalized to work with a unified set of inputs
- These modules are imported by main.nf/complete.nf

**nextflow.config**
- The main config file that specifies profiles, parameters, and other options

**refs/**
- This directory is used to store reference genomes or files

**results/**
- This directory is used to store results
- Results are *not* uploaded into this repo

