# Deflation-in-japan-nk-model
Japan’s Lost Decade: NK-DSGE

A small New Keynesian DSGE model, simulated in Dynare, that illustrates how a persistent fall in the natural rate of interest can trap an economy at the zero lower bound. The model consists of a dynamic IS curve, a New Keynesian Phillips curve, a Taylor rule with interest rate smoothing and a zero floor, and an AR(1) natural rate.

The economy starts at its steady state, then a negative natural rate shock hits in the first quarter. With persistence of 0.98, the natural rate stays negative for years, the nominal rate is stuck at zero, the real rate rises, and deflation and a negative output gap follow.

The model is solved under perfect foresight, Parameters are calibrated to values common in the literature on Japan, not estimated. this simplifications was made due to fact the model goal was to show ZLB mechanism rather than simulating a real life estimation 

## Calibration table

All rates and the shock are quarterly. The simulation runs for 60 quarters (15 years).

| Risk aversion | σ | 1.5 |

| Discount factor | β | 0.99 |

| Phillips curve slope | κ | 0.01 |

| Taylor rule response to inflation | φ_π | 1.5 |

| Taylor rule response to output gap | φ_x | 0.5 |

| Interest rate smoothing | ρ_i | 0.80 |

| Natural rate persistence | ρ_rn | 0.98 |

| Starting natural rate | r_n0 | 0.5% |

| Shock size (first quarter) | ε | -1.4% |
