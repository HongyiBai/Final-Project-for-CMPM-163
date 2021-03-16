Shader "shader/music notes"
{
    Properties
    {

        _MainTex(" First Texture", 2D) = "white"{}
        _Wave("Waveyness", Float) = 0






    }
        SubShader
        {

            Pass
            {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag

                sampler2D _MainTex;
                float _Wave;
















                struct VertexShaderInput
                {

                    float4 vertex:POSITION;
                    float2 uv:TEXCOORD0;
                };

                struct VertexShaderOutput
                {

                    float4 pos: SV_POSITION;
                    float2 uv:TEXCOORD0;
                    float4 objpos: TEXCOORD1;
                };

                VertexShaderOutput vert(VertexShaderInput v)
                {
                    VertexShaderOutput o;


                    o.uv = v.uv;
                    o.objpos = v.vertex;

                    v.vertex.y = v.vertex.y + sin(_Time * v.uv.y * _Wave);

                    o.pos = UnityObjectToClipPos(v.vertex);

                    return o;
                }

                float4 frag(VertexShaderOutput i) :SV_TARGET
                {


                    float4 color1 = tex2D(_MainTex, i.uv);


                    return color1;

                }






                    ENDCG
                }
        }
}