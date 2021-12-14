Shader "Custom/PreDefined_input_structures" {
    SubShader {
        Pass{
        
        CGPROGRAM
        
            #pragma vertex vert  
            #pragma fragment frag 
            #include "UnityCG.cginc"

               // struct appdata_base {
               //  float4 vertex : POSITION;
               //  float3 normal : NORMAL;
               //  float4 texcoord : TEXCOORD0;
               //  };
                //
                //  
                // struct appdata_tan {
                 //    float4 vertex : POSITION;
                //    float4 tangent : TANGENT;
                //    float3 normal : NORMAL;
                //    float4 texcoord : TEXCOORD0;
                // };
                //
                // 
                // struct appdata_full {
                //    float4 vertex : POSITION;
                //    float4 tangent : TANGENT;
                //    float3 normal : NORMAL;
                //    float4 texcoord : TEXCOORD0;
                //    float4 texcoord1 : TEXCOORD1;
                //    float4 texcoord2 : TEXCOORD2;
                //    float4 texcoord3 : TEXCOORD3;
                //    fixed4 color : COLOR;
                //    // and additional texture coordinates only on XBOX360
                // };

                // struct appdata_img {
                //    float4 vertex : POSITION;
                //    half2 texcoord : TEXCOORD0;
                // };
 
            struct vertexOutput {
                float4 pos : SV_POSITION;
                float4 col : TEXCOORD0;
            };
 
            vertexOutput vert(appdata_full input) 
            {
                vertexOutput output;
 
                output.pos = UnityObjectToClipPos(input.vertex);
                //output.col = input.texcoord;
                output.col = float4(input.texcoord.x, 0.0, 0.0, 1.0);

                return output;
            }
 
            float4 frag(vertexOutput input) : COLOR 
            {
                return input.col; 
            }
        
        ENDCG
        }
        
    }
}