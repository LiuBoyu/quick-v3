#ifndef __CCSHADER_FILTER_H__
#define __CCSHADER_FILTER_H__

#include "cocos2d.h"
#include "platform/CCGL.h"
#include "filters/shaders/ccFilterShaders.h"

NS_CC_BEGIN

class FilteredSprite;

//================== Filter

class Filter : public Ref
{
public:
	Filter();
	~Filter();

	virtual void initSprite(FilteredSprite* $sprite);
	virtual void draw();
	GLProgram* getProgram();
    GLProgramState* getGLProgramState();

	const char* shaderName;
protected:
    GLProgramState* _pProgramState;
	void initProgram();
	virtual GLProgram* loadShader();
	virtual void setAttributes(GLProgram* $glp);
	virtual void setUniforms(GLProgram* $glp);
};

class SingleFloatParamFilter : public Filter
{
public:
	SingleFloatParamFilter();

	virtual void setParameter(float $param);
protected:
	float _param;
};



NS_CC_END

#endif /* __CCSHADER_FILTER_H__ */
