author: Yousen Zhang
title: This is the documentation for the general producer

General producer
================

These are short notes for
[`ParticleProducer`](https://github.com/yszhang95/VertexCompositeAnalysis/tree/ParticleFitter_8_0_X).

General descriptions
--------------------

The `ParticleProducer` is a general `edm::EDProducer` to reconstruct any
type of particles as long as proper daughter particles collections are
available (like tracks, muons, electrons and jets). The output of
`ParticleProducer` consist of `pat::GenericParticleCollection` objects
of reconstructed particles and their decay products (daughters and
granddaughters if any) and a collection of primary vertices. An example
is illustrated.

``` example
Type                              Module                      Label         Process
----------------------------------------------------------------------------------------------
vector<pat::GenericParticle>      "generalD0CandidatesNew"    ""            "D0PbPb2018SKIM"
vector<pat::GenericParticle>      "generalD0CandidatesNew"    "daughters"   "D0PbPb2018SKIM"
vector<reco::Vertex>              "generalD0CandidatesNew"    "vertices"    "D0PbPb2018SKIM"
```

### How it works

The `ParticleProducer` make use of several sub-modules to produce target
`edm` format objects. It has two private member variables –
`ParticleFitter fiter_` and `ParticleDaughter daughter_`. `fitter_` help
user to reconstructed particles via their decay products (stored in
`daughter_`). If there is no vector of daughter `PSet`, it will save
input collection as `pat::GenericParticleCollection` (just take the
input as the target).

In practice, this producer will do following things in order:

-   Reserve `edm` products (`reco::VertexCollection`) of vertices.
    Primary vertex collection are sent into the producer via
    `ParticleFitter::setVertex`.
-   If the vector of daughter `PSet` is available, the producer will
    reserve `edm` products for daughter collection storage. Further, the
    producer fill `ParticleDaughter` vector following the
    configurations. Once the vector of daughter collections is ready,
    this producer will fit candidates via `ParticleFitter::fitAll`.
-   Everything will be moved to output `AOD` file. Vertex collection and
    daughter collection are filled in the reserved `edm` product created
    in previous steps. The target decay particles will be stored in the
    `pat::GenericParticleCollection`.

### How `ParticleFitter::setVertex` and `ParticleFitter::fitAll` work

1.  `ParticleFitter::setVertex`

    It will take primary vertex collection and beam spot as input. If
    there is no valid PV collection, a vertex will be constructed from
    beam spot. PVs in the collection are ordered by track size (need to
    update for backward compatibility).

2.  `ParticleFitter::fitAll`

    It will call `ParticleFitter::fillDaughters` and
    `ParticleFitter::makeCandidates`.

    -   `ParticleFitter::fillDaughters` It will call
        `ParticleDaughter::init` and `ParticleDaughter::addParticles`.
        The first one is intended for muons (further studies needed).
        The second one is to convert input daughter collection (could be
        tracks, muons etc.) with `pat::GenericParticle`.
    -   `ParticleFitter::makecandidates` Decay particles are
        reconstructed here using the daughter collections obtained in
        the previous step. Candidates will have the total four-momenta
        of daughters. Combinations of daughters are done via
        [`make_combinations`](https://github.com/artem-ogre/combinations_cpp).
        User can use several [string cut
        parsers](https://twiki.cern.ch/twiki/bin/view/CMSPublic/SWGuidePhysicsCutParser)
        (`preSelection`, `preMassSelection`, `pocaSelection`,
        `postSelection` and `finalSelection`) to do simple selections.

Configurations
--------------

### Examples

-   $\Lambda_c \to K_s+p$

    ``` python
    # Add the VertexComposite producer
    from VertexCompositeAnalysis.VertexCompositeProducer.generalParticles_cff import generalParticles
    process.kShort = generalParticles.clone(
        pdgId = cms.int32(310),
        charge = cms.int32(0),
        doSwap = cms.bool(False),
        width = cms.double(0.2),

        preSelection = cms.string(""),
        pocaSelection = cms.string("pt >= 1.0 && abs(rapidity) < 2.4"),
        postSelection = cms.string(""),
        preMassSelection = cms.string(""),
        finalSelection = cms.string( " "),
        # daughter information
        daughterInfo = cms.VPSet([
            cms.PSet(pdgId = cms.int32(211), charge = cms.int32(-1),
                  selection = cms.string(
                  "pt>1.0 && abs(eta)<2.4"
                  "&& quality('loose')"" && ptError/pt<0.1"
                  "&& normalizedChi2<7.0"
                  "&& numberOfValidHits >=4")
                ),
            cms.PSet(pdgId = cms.int32(211), charge = cms.int32(+1),
                  selection = cms.string(
                  "pt>1.0 && abs(eta)<2.4"
                  "&& quality('loose')"" && ptError/pt<0.1"
                  "&& normalizedChi2<7.0"
                  "&& numberOfValidHits >=4")
                ),
        ]),
    )

    process.LambdaC = generalParticles.clone(
        pdgId = cms.int32(4122),
        doSwap = cms.bool(False),
        preMassSelection = cms.string("abs(charge)==1"),
        finalSelection = cms.string(''),
        # daughter information
        daughterInfo = cms.VPSet([
            cms.PSet(pdgId = cms.int32(310), source = cms.InputTag('kShort'),
                     selection = cms.string('')),
            cms.PSet(pdgId = cms.int32(2212), #charge = cms.int32(+1),
                     selection = cms.string("pt>1.0 && abs(eta)<2.4"
                     "&& quality('highPurity') && ptError/pt<0.1"
                     "&& normalizedChi2<7.0"
                     "&& numberOfValidHits >=11")),
        ]),
    )

    # Add ntrack map
    process.load("VertexCompositeAnalysis.VertexCompositeProducer.nTracks_cfi")
    process.ntrack_seq = cms.Sequence(process.nTracks)

    # Define the analysis steps
    process.rereco_step = cms.Path(process.ntrack_seq * process.kShort * process.LambdaC)
    ```

-   $D^0 \to K\pi$

    ``` python
    # D0 candidate rereco
    process.load("VertexCompositeAnalysis.VertexCompositeProducer.generalParticles_cff")
    process.generalD0CandidatesNew = process.generalParticles.clone(
        pdgId = cms.int32(421),
        doSwap = cms.bool(True),
        width = cms.double(0.15),

        preSelection = cms.string(""
           "charge==0"
           "&& userFloat('dauPtSum') >= 1.6 && userFloat('dauEtaDiff') <= 1.0"
           ),
        pocaSelection = cms.string(""
           "userFloat('bestMass') >= 1.71 && userFloat('bestMass') <= 2.02 && pt >= 1.0"
           "&& userFloat('dca') >= 0 && userFloat('dca') <= 9999."
           ),
        postSelection = cms.string(""
           "userFloat('vertexProb') >= 0.02"
           "&& userFloat('normChi2') <= 9999.0"
           ),
        finalSelection = cms.string(""
           "userFloat('rVtxMag') >= 0.0 && userFloat('rVtxSig') >= 2.0"
           "&& userFloat('lVtxMag') >= 0.0 && userFloat('lVtxSig') >= 3.0"
           "&& cos(userFloat('angle3D')) >= -2.0 && cos(userFloat('angle2D')) >= -2.0"
           "&& abs(userFloat('angle3D')) <= 0.2 && abs(userFloat('angle2D')) <= 0.2"
           "&& abs(rapidity) < 2.0"
           ),
        dEdxInputs = cms.vstring('dedxHarmonic2', 'dedxPixelHarmonic2'),
    #
        # daughter information
        daughterInfo = cms.VPSet([
            cms.PSet(pdgId = cms.int32(321), charge = cms.int32(-1),
               selection = cms.string(
                  "pt>1.0 && abs(eta)<2.4"
                  "&& quality('highPurity') && ptError/pt<0.1"
                  "&& (normalizedChi2/hitPattern.trackerLayersWithMeasurement)<0.18"
                  "&& numberOfValidHits >=11"
                  ),
               finalSelection = cms.string(''
                  'abs(userFloat("dzSig")) < 3.0 && abs(userFloat("dxySig")) < 3.0'
                  '&& (track.algo!=6 || userFloat("mva")>=0.98)'
                  )
               ),
            cms.PSet(pdgId = cms.int32(211), charge = cms.int32(+1),
               selection = cms.string(
                  "pt>1.0 && abs(eta)<2.4"
                  "&& quality('highPurity') && ptError/pt<0.1"
                  "&& (normalizedChi2/hitPattern.trackerLayersWithMeasurement)<0.18"
                  "&& numberOfValidHits >=11"
                  ),
               finalSelection = cms.string(''
                  'abs(userFloat("dzSig")) < 3.0 && abs(userFloat("dxySig")) < 3.0'
                  '&& (track.algo!=6 || userFloat("mva")>=0.98)'
                  )
               )
        ])
      )
    process.generalD0CandidatesNew.mva = cms.InputTag("generalTracks","MVAValues") ###cesar:to change iter6 tracking mva cut
    ```

### Options

| Name              | Descriptions                                                                     | Type           | Default values           |
|-------------------|----------------------------------------------------------------------------------|----------------|--------------------------|
| `pdgId`           |                                                                                  | `cms.int32`    |                          |
| `doSwap`          | Save time to avoid fit the decay vertex multiple times                           | `cms.bool`     | `False`                  |
| `width`           |                                                                                  | `cms.double`   |                          |
| `daughterInfo`    | Configurations for daughters                                                     | `cms.VPSet`    |                          |
| `fitAlgo`         | Fit algorithms                                                                   | `cms.vuint32`  | `[0]`                    |
| `matchVertex`     | Further documentation needed.                                                    | `cms.bool`     | `False`                  |
| `puMap`           | Further documentation needed.                                                    | `cms.vdouble`  |                          |
| `primaryVertices` |                                                                                  | `cms.InputTag` | `offlinePrimaryVertices` |
| `electrons`       | The `pdgId` need to be 11                                                        | `cms.InputTag` |                          |
| `muons`           | The `pdgId` need to be 13                                                        | `cms.InputTag` | `patMuons`               |
| `taus`            | The `pdgId` need to be 15                                                        | `cms.InputTag` |                          |
| `photons`         | The `pdgId` need to be 22                                                        | `cms.InputTag` |                          |
| `tracks`          | The `pdgId` need to be different from numbers listed in this table and charge!=0 | `cms.InputTag` | `generalTracks`          |
| `pfParticles`     | The `pdgId` need to be 0                                                         | `cms.InputTag` |                          |
| `jets`            | The `pdgId` need to be \<= 6                                                     | `cms.InputTag` |                          |
| `conversions`     | Converted photons, `pdgId` need to be -22                                        | `cms.InputTag` |                          |
| `mva`             | MVA `ValueMap` for the track collection                                          | `cms.InputTag` |                          |
| `dEdxInputs`      | Module names of `dEdx` `ValueMap`                                                | `cms.vstring`  |                          |

| Name                                                          | Index | Default parameters (currently not configurable)                                                   |
|---------------------------------------------------------------|-------|---------------------------------------------------------------------------------------------------|
| Unconstrained kinematic fitter                                | 0     | maxDistance=0.01, maxNbrOfIterations=100                                                          |
| Kinematic fitter with `MultiTrackPointingKinematicConstraint` | 1     | maxDelta=0.01, maxNbrOfIterations=1000, maxReducedChiSq=225, minChiSqImprovement=50               |
| Kinematic fitter with `MultiTrackMassKinematicConstraint`     | 2     | world-average mass, and further documentation needed.                                             |
| Kalman vertex fitter                                          | 3     | maxDistance=0.01, maxNbrOfIterations=10                                                           |
| Adaptive vertex fitter                                        | 4     | maxshift=0.0001, maxlpshift=0.1, maxstep=30, weightthreshold=0.001, further documentation needed. |
| Gsf vertex Fitter                                             | 5     | maxDistance=0.01, maxNbrOfIterations=10, limitComponents=false, smoothTracks=true                 |
| Adaptive Gsf vertex fitter                                    | 6     | maxshift=0.0001, maxlpshift=0.1, maxstep=30, weightthreshold=0.001, limitComponents=false         |

| Name             | Descriptions                                                                | Type           | Default values |
|------------------|-----------------------------------------------------------------------------|----------------|----------------|
| `pdgId`          | Used to label the particles and determine the input collection              | `cms.int32`    |                |
| `mass`           |                                                                             | `cms.double`   |                |
| `charge`         |                                                                             | `cms.int32`    |                |
| `width`          |                                                                             | `cms.double`   |                |
| `selection`      |                                                                             | `cms.string`   |                |
| `finalSelection` |                                                                             | `cms.string`   |                |
| `source`         | Input source of daughter particles. Determined by `pdgId` if not specified. | `cms.InputTag` |                |

| Name                | Descriptions | Type         | Default values |
|---------------------|--------------|--------------|----------------|
| `propToMuon`        |              | `cms.bool`   |                |
| `useSimpleGeometry` |              | `cms.bool`   | `True`         |
| `useTrack`          |              | `cms.string` | `none`         |
| `useState`          |              | `cms.string` | `atVertex`     |
| `fallbackToME1`     |              | `cms.bool`   | `True`         |
| `useMB2InOverlap`   |              | `cms.bool`   | `True`         |
| `useStation2`       |              | `cms.bool`   | `True`         |

| Selection                          | `userFloat`                                                                                                                                             |
|------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| `preselection`                     | `dauPtSum`, `dauEtaDiff` (when having 2 daughters)                                                                                                      |
| `preMassselection`                 | `bestMass` (when having `doSwap` true)                                                                                                                  |
| `pocaSelection`                    | `dca` (when having 2 tracks as daugthers), `bestMass`                                                                                                   |
| `postSelection`                    | `normChi2` (chi2/ndf), `vertexProb`                                                                                                                     |
| `finalselection`                   | `lVtxMag` (3D decay length), `rVtxMag` (2D decay length), `lVtxSig` (3D decay length significance), `rVtxSig`, `angle3D` (3D pointing angle), `angle2D` |
| `finalSelection` (daughter `PSet`) | `dz`, `dxy`, `dzSig`, `dxySig`, `mva`, `dEdx_*` (\* means input tag of dedx), if they are available                                                     |

Class member functions and variables
------------------------------------

### `ParticleComparator`

Compare particles using their pT, eta, phi, charge (order follows their
precedence).

### `ParticleMassComparator`

Compare particles using their mass, pT, eta, phi, charge (order follows
their precedence).

### `ParticleTreeComparator`

Compare particles using their mass, charge, pT, eta, phi (order follows
their precedence).

### `ParticleDaughter`

A class for daughter particle storage.

1.  `pdgId()`

    Return PDG ID of the particle.

2.  `charge()`

    Return charge of the specie of particle.

3.  `mass()`

    Return mass.

4.  `width()`

    Return the width of mass window during the candidate selection.

5.  `particles()`

    Return the particle collection for the `ParticleDaughter` object.

6.  `useSource()`

    Return if user give any source input to the `ParticleDaughter`
    object.

7.  `addParticles(const edm::Event& event, const edm::EDGetTokenT<std::vector<T> >& token, const reco::Vertex& vertex, const bool embedInfo=true);`

    Add particles to the `ParticleDaughter` object. The
    `GenericParticle` object will be filled via `addData` and `addInfo`.
    If track info is available, `userFloat` variables: `dz`, `dxy`,
    `dzSig` and `dxySig` will be available. `dEdx` and track MVA info
    (if any) will be saved as `userFloat` via
    `ParticleDaughter::setDeDx` and `ParticleDaughter::setMVA`. Users
    can apply cuts via `selction` and `finalSelection`. Cuts implemented
    via member functions can be applied via `selection`. Cuts on
    `userFloat` variables need to be done via `finalSelection`.

8.  `addParticles(const edm::Event& event)`

    Add particles to the `ParticleDaughter` object. This function will
    read from `source` rather than other collections like
    `reco::TrackCollection`.

9.  `fillInfo(const edm::ParameterSet& pSet, const edm::ParameterSet& config, edm::ConsumesCollector& iC)`

    Fill info based on configurations of daughter `PSet`.

10. `init(const edm::EventSetup& iSetup)`

    A function for muon setup (further documentations needed).

11. `addInfo(pat::GenericParticle& c, const T& p)`

    Set four-momentum, charge and corresponding vertex.

12. `addInfo(pat::GenericParticle& c, const reco::Conversion& p)`

    Not very clear, need to explore more. Refit the vertex of the track
    collection and save it as a `GenericParticle`. Set four-momentum,
    charge, vertex position and track references.

13. `addData(pat::GenericParticle& c, const edm::Ref<std::vector<T> >& p, const bool& embedInfo)`

    `c.addUserData<T>("src", *p);`

14. `addData(pat::GenericParticle& c, const reco::TrackRef& p, const bool& embedInfo)`

    Add track info and set `sourceID` (a `userInt` for checking
    duplicate daughters) to 1.

15. `addData(pat::GenericParticle& c, const reco::PFCandidateRef& p, const bool& embedInfo)`

    Set info from `PFCandidate`. A `userData` called `src` will be
    added. Track reference info will be added as well if available.

16. `addData(pat::GenericParticle& c, const pat::MuonRef& p, const bool& embedInfo)`

    Add muon info. `userData` called `src` will be added. Optional user
    data may exist including:

    -   `userData`: `trackRef`
    -   `userFloat`: `l1Eta`, `l1Phi`
    -   `userInt`: `prop` -\> 1

17. `addData(pat::GenericParticle& c, const pat::ElectronRef& p, const bool& embedInfo)`

    Set info for electron. Add `src` (`userData`) and track reference
    (maybe).

18. `setMVA (pat::GenericParticle& c, const size_t& i, const edm::Handle<std::vector<float> >& m)`

    Set MVA value for tracks.

19. `setDeDx(pat::GenericParticle& c, const std::map<std::string, edm::Handle<edm::ValueMap<reco::DeDxData> > >& m)`

    Set `dEdx` info for daughters if available.

20. `addMuonL1Info(pat::GenericParticle& c, const edm::Handle<pat::TriggerObjectStandAloneMatch>& m)`

    Further documentation needed.

### `ParticleFitter`

1.  `addParticles(ParticleDaughter& d, const edm::Event& iEvent)`

    Add particles depending on `pdgId` of `ParticleDaughter`.

General tree producer
=====================

Configurations
--------------

### Examples

-   $D^{0} \to K\pi$, tree producer

    ``` example
    # tree producer
    from VertexCompositeAnalysis.VertexCompositeAnalyzer.particle_tree_cff import particleAna
    process.generalanaNew = particleAna.clone(
      recoParticles = cms.InputTag("generalD0CandidatesNew"),
      triggerInfo = cms.untracked.VPSet([
        cms.PSet(path = cms.string('HLT_HIMinimumBias_*')), # Minimum bias
      ]),
      selectEvents = cms.string("eventFilter_HM"),
    )
    process.generalanaNewSeq = cms.Sequence(process.generalanaNew)
    process.generalana_step = cms.EndPath( process.generalanaNewSeq )
    ```

-   $\Lambda_{c} \to K_{s}+p$, ntuple producer

    ``` example
    # Add the VertexComposite tree
    from VertexCompositeAnalysis.VertexCompositeAnalyzer.particle_tree_cff import particleAna_mc
    process.lambdacAna_mc = particleAna_mc.clone(
      recoParticles = cms.InputTag("LambdaC"),
      genParticles = cms.untracked.InputTag("genParticles"),
      selectEvents = cms.string(""),
      addSource    = cms.untracked.bool(False),
      genPdgId     = cms.untracked.vuint32([4122, 310, 2212, 211]),
      saveTree = cms.untracked.bool(False)
    )
    process.p = cms.EndPath(process.lambdacAna_mc)
    ```

### Options

| Name                 | Descriptions                                                                                                   | Type                     | Default values                         |
|----------------------|----------------------------------------------------------------------------------------------------------------|--------------------------|----------------------------------------|
| `beamSpot`           |                                                                                                                | `cms.InputTag`           | `offlineBeamSpot`                      |
| `primaryVertices`    |                                                                                                                | `cms.InputTag`           | `offlinePrimaryVertices`               |
| `recoParticles`      | The `pat::GenericParticleCollection` user want to save as tree                                                 | `cms.InputTag`           | `generalParticles`                     |
| `nTracksVMap`        | The `ValueMap` of number of offline tracks                                                                     | `cms.untracked.InputTag` | `generalParticles:nTracks`             |
| `triggerResults`     |                                                                                                                | `cms.untracked.InputTag` | `TriggerResults::HLT`                  |
| `triggerEvent`       |                                                                                                                | `cms.untracked.InputTag` | `hltTriggerSummaryAOD::HLT`            |
| `triggerInfo`        | Further documentation needed                                                                                   | `cms.untracked.VPSet`    |                                        |
| `matchInfo`          | trigger-reco matching information, further documentation needed                                                | `cms.untracked.VPSet`    |                                        |
| `eventFilterResults` |                                                                                                                | `cms.untracked.InputTag` | `TriggerResults`                       |
| `eventFilterNames`   |                                                                                                                | `cms.untracked.vstring`  | Please check corresponding branch      |
| `selectEvents`       |                                                                                                                | `cms.string`             | Please check corresponding branch      |
| `centralityBin`      |                                                                                                                | `cms.untrakced.InputTag` | `InputTag("centralityBin","HFtowers")` |
| `centrality`         |                                                                                                                | `cms.untracked.InputTag` | `hiCentrality`                         |
| `eventPlane`         |                                                                                                                | `cms.untracked.InputTag` | `hiEvtPlaneFlat`                       |
| `lumiInfo`           |                                                                                                                | `cms.untracked.InputTag` | `InputTag("lumiInfo", "brilcalc")`     |
| `lumiScalers`        |                                                                                                                | `cms.untracked.InputTag` | `scalersRawToDigi`                     |
| `lumiRecord`         |                                                                                                                | `cms.untracked.InputTag` | `onlineMetaDataDigis`                  |
| `saveTree`           | If `True` then save tree else save ntuple                                                                      | `cms.untracked.bool`     | `True`                                 |
| `addTrgObj`          |                                                                                                                | `cms.untracked.bool`     | `False`                                |
| `genParticles`       | Input tag for `reco::GenParticleCollection`. Work when dealing with MC samples                                 | `cms.untracked.InputTag` | `genParticles`                         |
| `genInfo`            | Further documentation needed                                                                                   | `cms.untracked.InputTag` | `generator`                            |
| `genPdgId`           | The vector saving `pdgId` of decay particles, their decay products and other particles users want to match gen | `cms.untracked.vuint32`  | left as empty                          |
