#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "cge.h"
#import "cgeAction.h"
#import "cgeAnimation.h"
#import "cgeCommonDefine.h"
#import "cgeFilters.h"
#import "cgeGLFunctions.h"
#import "cgeGlobal.h"
#import "cgeImageFilter.h"
#import "cgeImageHandler.h"
#import "cgeMat.h"
#import "cgeParticleSystem.h"
#import "cgePlatform_iOS.h"
#import "cgeScene.h"
#import "cgeShaderFunctions.h"
#import "cgeSlideshow.h"
#import "cgeSlideshowSprite2d.h"
#import "cgeSlideshowSprite2dWith3dSpace.h"
#import "cgeSprite2d.h"
#import "cgeSprite3d.h"
#import "cgeSpriteCommon.h"
#import "cgeStaticAssert.h"
#import "cgeTextureUtils.h"
#import "cgeThread.h"
#import "cgeVec.h"
#import "cgeAdvancedEffects.h"
#import "cgeAdvancedEffectsCommon.h"
#import "cgeBeautifyFilter.h"
#import "cgeBilateralBlurFilter.h"
#import "cgeBlendFilter.h"
#import "cgeBrightnessAdjust.h"
#import "cgeColorBalanceAdjust.h"
#import "cgeColorLevelAdjust.h"
#import "cgeColorMappingFilter.h"
#import "cgeContrastAdjust.h"
#import "cgeCrosshatchFilter.h"
#import "cgeCurveAdjust.h"
#import "cgeDataParsingEngine.h"
#import "cgeDynamicFilters.h"
#import "cgeDynamicWaveFilter.h"
#import "cgeEdgeFilter.h"
#import "cgeEmbossFilter.h"
#import "cgeExposureAdjust.h"
#import "cgeFilterBasic.h"
#import "cgeHalftoneFilter.h"
#import "cgeHazeFilter.h"
#import "cgeHueAdjust.h"
#import "cgeLerpblurFilter.h"
#import "cgeLiquidationFilter.h"
#import "cgeLookupFilter.h"
#import "cgeMaxValueFilter.h"
#import "cgeMidValueFilter.h"
#import "cgeMinValueFilter.h"
#import "cgeMonochromeAdjust.h"
#import "cgeMosaicBlurFilter.h"
#import "cgeMotionBlurAdjust.h"
#import "cgeMotionFlowFilter.h"
#import "cgeMultipleEffects.h"
#import "cgeMultipleEffectsCommon.h"
#import "cgePolarPixellateFilter.h"
#import "cgePolkaDotFilter.h"
#import "cgeRandomBlurFilter.h"
#import "cgeSaturationAdjust.h"
#import "cgeSelectiveColorAdjust.h"
#import "cgeShadowHighlightAdjust.h"
#import "cgeSharpenBlurAdjust.h"
#import "cgeSketchFilter.h"
#import "cgeSoulStuffFilter.h"
#import "cgeTiltshiftAdjust.h"
#import "cgeVignetteAdjust.h"
#import "cgeWhiteBalanceAdjust.h"
#import "cgeZoomBlurAdjust.h"
#import "cgeAnimationParser.h"
#import "cgeCameraDevice.h"
#import "cgeCameraFrameRecorder.h"
#import "cgeCVUtilTexture.h"
#import "cgeDynamicImageViewHandler.h"
#import "cgeFrameRecorder.h"
#import "cgeFrameRenderer.h"
#import "cgeImageHandlerIOS.h"
#import "cgeImageViewHandler.h"
#import "cgeProcessingContext.h"
#import "cgeSharedGLContext.h"
#import "cgeUtilFunctions.h"
#import "cgeVideoCameraViewHandler.h"
#import "cgeVideoFrameRecorder.h"
#import "cgeVideoHandlerCV.h"
#import "cgeVideoPlayer.h"
#import "cgeVideoPlayerViewHandler.h"
#import "cgeVideoWriter.h"
#import "cgeBuiltinModels.h"
#import "cgeModelCube.h"
#import "cgeModelTeapot.h"

FOUNDATION_EXPORT double cgeVersionNumber;
FOUNDATION_EXPORT const unsigned char cgeVersionString[];

