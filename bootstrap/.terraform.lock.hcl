# This file is maintained automatically by "tofu init".
# Manual edits may be lost in future updates.

provider "registry.opentofu.org/fluxcd/flux" {
  version     = "1.6.4"
  constraints = ">= 1.5.0"
  hashes = [
    "h1:bpCGHUhnzfqEyTkylsp+unO2x2VDScPFfyNOt95LUSE=",
    "zh:0fd41e6f4d49c616b2432f74bb695d714d0a6e01f67f33a3a691b0e9706e40e9",
    "zh:14f554a26fbfe22410efd4a56b4e49cac76ca718cb15063afaee73bf24f785b8",
    "zh:178f48233ed65a9693e5c6d0d18c4166e7fc059e41a4b49f22c784ddf8acad58",
    "zh:21572b76a54e270b6fa88e79aab7cc7a4c528ad5f1fa1b31787176674384de6e",
    "zh:26dd8b69f97136204c7df5a65457725b2bd6524ab551478128603b11019a4853",
    "zh:5a7fb46cde2e7e39d2f8c7fb84c4af573a5193e2548e9c50246904fd06102e7d",
    "zh:5e425275846ef98599f5f04adbecc79b02c3c660c051f93ed7073bfef9c2a1dd",
    "zh:64d4992afe408d1d793e9d8600ab8338eec62aefa2a99aa7296fa844d639f773",
    "zh:6e1c0d6812feaef032f0c302916eccf6d2cc7a4be689f4b846f696eed0676a1f",
    "zh:89049ea4b7018dee57ce95c453d7775d3033ae240fe5cb0696a1375c2a1f2c82",
    "zh:9a81b7b2574aa303e70a1153a03a49d367393cb52ff73b73a15f92765c6de6a2",
    "zh:c91fff5aca6448922de17d23fc836436624b6e33b58965af64c0977e9f1225c2",
    "zh:f3f8a45895f5a2a16b5680fdb7691135247bbb52c166e31d7331791cfcea9c5b",
    "zh:fcadc03d437609df66be2d4bcc22843548a5a7e66928e2f0c2d461105669c893",
  ]
}

provider "registry.opentofu.org/hashicorp/helm" {
  version     = "2.17.0"
  constraints = "2.17.0"
  hashes = [
    "h1:69PnHoYrrDrm7C8+8PiSvRGPI55taqL14SvQR/FGM+g=",
    "zh:02690815e35131a42cb9851f63a3369c216af30ad093d05b39001d43da04b56b",
    "zh:27a62f12b29926387f4d71aeeee9f7ffa0ccb81a1b6066ee895716ad050d1b7a",
    "zh:2d0a5babfa73604b3fefc9dab9c87f91c77fce756c2e32b294e9f1290aed26c0",
    "zh:3976400ceba6dda4636e1d297e3097e1831de5628afa534a166de98a70d1dcbe",
    "zh:54440ef14f342b41d75c1aded7487bfcc3f76322b75894235b47b7e89ac4bfa4",
    "zh:6512e2ab9f2fa31cbb90d9249647b5c5798f62eb1215ec44da2cdaa24e38ad25",
    "zh:795f327ca0b8c5368af0ed03d5d4f6da7260692b4b3ca0bd004ed542e683464d",
    "zh:ba659e1d94f224bc3f1fd34cbb9d2663e3a8e734108e5a58eb49eda84b140978",
    "zh:c5c8575c4458835c2acbc3d1ed5570589b14baa2525d8fbd04295c097caf41eb",
    "zh:e0877a5dac3de138e61eefa26b2f5a13305a17259779465899880f70e11314e0",
  ]
}

provider "registry.opentofu.org/integrations/github" {
  version     = "6.6.0"
  constraints = ">= 6.1.0"
  hashes = [
    "h1:Fp0RrNe+w167AQkVUWC1WRAsyjhhHN7aHWUky7VkKW8=",
    "zh:0b1b5342db6a17de7c71386704e101be7d6761569e03fb3ff1f3d4c02c32d998",
    "zh:2fb663467fff76852126b58315d9a1a457e3b04bec51f04bf1c0ddc9dfbb3517",
    "zh:4183e557a1dfd413dae90ca4bac37dbbe499eae5e923567371f768053f977800",
    "zh:48b2979f88fb55cdb14b7e4c37c44e0dfbc21b7a19686ce75e339efda773c5c2",
    "zh:5d803fb06625e0bcf83abb590d4235c117fa7f4aa2168fa3d5f686c41bc529ec",
    "zh:6f1dd094cbab36363583cda837d7ca470bef5f8abf9b19f23e9cd8b927153498",
    "zh:772edb5890d72b32868f9fdc0a9a1d4f4701d8e7f8acb37a7ac530d053c776e3",
    "zh:798f443dbba6610431dcef832047f6917fb5a4e184a3a776c44e6213fb429cc6",
    "zh:cc08dfcc387e2603f6dbaff8c236c1254185450d6cadd6bad92879fe7e7dbce9",
    "zh:d5e2c8d7f50f91d6847ddce27b10b721bdfce99c1bbab42a68fa271337d73d63",
    "zh:e69a0045440c706f50f84a84ff8b1df520ec9bf757de4b8f9959f2ed20c3f440",
    "zh:efc5358573a6403cbea3a08a2fcd2407258ac083d9134c641bdcb578966d8bdf",
    "zh:f627a255e5809ec2375f79949c79417847fa56b9e9222ea7c45a463eb663f137",
    "zh:f7c02f762e4cf1de7f58bde520798491ccdd54a5bd52278d579c146d1d07d4f0",
    "zh:fbd1fee2c9df3aa19cf8851ce134dea6e45ea01cb85695c1726670c285797e25",
  ]
}

provider "registry.opentofu.org/tehcyx/kind" {
  version     = "0.9.0"
  constraints = ">= 0.8.0"
  hashes = [
    "h1:X+GBBnJ8+0lfprSxOCDG0tRWltXMYlxJDbicE3I8Z4I=",
    "zh:315628279e657b868565b6d54b892982b27d6db95393d1cac646dd736af208e5",
    "zh:401922e7844a9579da5dfa17b5a2d558cbff91e666dea013a6007dd117841204",
    "zh:74665f4532101a2bdf7b6bd19f1f31e76fa13e9ad29149dddccf24e3f0eaae35",
    "zh:b752c132322445823a754fc6d4fb5d692049805840e4a597fc7cdf73f4a98fbf",
    "zh:d381786bd7b23b36a7827e48981b37e39128cb980c44a8d474206dc62f94bc00",
    "zh:e600776e37201ea202e8196954369b084b358c75a69f801470089d1c0d488199",
  ]
}
