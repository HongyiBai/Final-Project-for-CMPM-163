Shader "Unlit/color changeshader"
{
    Properties
    {
        _ColorA("ColorA", Color) = (1,1,1,1)
        _ColorB("ColorB", Color) = (1,1,1,1)
        _BlendFactor("BlendColor", Range(0,1)) = 0.7
        _DelayFactor("DelayFactor", Range(0,10)) = 0.07
    }

        SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            float4 _ColorA;
            float4 _ColorB;
            float _BlendFactor;
            float4 _BlendColor;
            float _DelayFactor;


            struct appdata {
                float4 vertex : POSITION;
            };

            struct v2f {
                float4 pos : SV_POSITION;
            };

            v2f vert(appdata v) {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }

            float4 frag(v2f i) : SV_Target{
                _BlendFactor = (sin(_Time));
                _BlendFactor = abs(sin(_Time.y + _DelayFactor) * 10);
                _BlendColor = _BlendFactor * _ColorA + (1 - _BlendFactor) * _ColorB;

                return _BlendColor;
            }


            ENDCG

        }

    }


}
