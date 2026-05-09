# Question-Grown Wiki

[English](README.md) | 中文

别再做知识的搬运工了。

把你的「困惑」「卡壳」，淬炼成一套专属于你的 LLM 理论私教课。

`question-grown-wiki` 是一组专为 Codex + Obsidian 打造的极简技能集。它的诞生只为对付一件事：学习现代大模型理论时的**虚假熟悉感**。

我们都有过这种经历：收藏了无数篇 Transformer 解析，记了几万字排版精美的笔记，但真遇到具体问题或推导公式时，大脑依然一片空白。因为传统的“第二大脑”太容易退化成信息垃圾桶了。

这个项目反其道而行之：它不是百科全书，而是一台**理解压力机**。你的 Wiki 里不应该有从网上照搬的宏大概念，每一页都必须从你**真的不懂**、**真的说错**、**真的推不出来**的真实痛点中生长出来。

## 核心哲学：从摩擦中生长

在这个系统里，没有大而全的“学习计划”，只有对具体问题的定点爆破。系统内定义了三个核心学习单元：

### Question：你的疑惑

你问过、怀疑过、推导失败过、想澄清的真实问题。

例如：

```text
为什么这里算 Attention 要除以 sqrt(d_k)？
```

### Correction：错题本

你说错了、被 AI 当场纠正的事实性错误，这比宽泛的笔记管用得多。

例如：

```text
我以为 KV Cache 存的是模型权重，AI 纠正我说它存的是前序 token 的状态。
```

### Misconception：深层误解

当某个 Correction 或 Question 反复出现时，它就暴露出你脑海里有一个更根深蒂固的
错误心智模型。

例如：

```text
我总是把训练时的并行计算和推理时的自回归生成搞混。
```

设计底线很简单：默认先建 `Correction`。不要急着升华。只有当同类错误重复出现，或者一次错误明显暴露稳定错误模型时，才归纳成 `Misconception`。如果只是手误、口误或打错字，就干脆不记。

## 它能帮你做什么

这套技能集给 Codex 设定了一份很窄、但极其严苛的 Obsidian 维护契约：

- 拒绝百科化：任何一个 `concept` 页面，都必须服务于真实的 `question` 或 `correction`。没有关联的概念，就不该进库。
- 公式推导必须说人话：所有公式推导不仅要有严格的 LaTeX、明确的 assumptions，还必须包含 intuition。看懂公式背后的常理，比背诵符号更重要。
- 动态维护学习前线：Codex 会持续整理 `gaps.md`、`review.md`、`map.md`、`hot.md` 和 `index.md`，让你的盲区、复盘队列和当前火力点保持可见。
- 保留错误现场：它不会只保存“正确答案”，还会保存你为什么错、错在哪里、下次如何识别同一种错。

最终目标不是让你拥有更多笔记，而是让你的疑惑和误解越来越少。

## 预设的五个 skills

整个产品刻意保持克制，只有五个动作：

```text
question-grown-wiki      # 大管家：负责路由请求，遵守总契约
question-grown-capture   # 案发现场记录仪：把当前对话、疑惑或纠错切片归档
question-grown-query     # 翻旧账机器：从你的个人 Wiki 里找答案
question-grown-review    # 灵魂拷问官：基于疑惑和错题进行抽查与复盘调度
question-grown-lint      # 知识库除草剂：清理坏链接和百科化杂草
```

## 如何开始

### 1. 安装

克隆本仓库，然后执行：

```bash
bash scripts/install_codex_skills.sh
```

脚本会把裁剪后的 skills 注册到 `~/.codex/skills`，并生成一份本地配置文件：

```text
~/.obsidian-wiki/config
```

### 2. 配置你的库

打开配置文件，把路径指向你的 Obsidian vault：

```text
OBSIDIAN_VAULT_PATH="/path/to/your/vault"
OBSIDIAN_WIKI_PROFILE="question-grown-llm-theory"
```

然后用 Obsidian 打开 `$OBSIDIAN_VAULT_PATH`，就可以开始了。

## 怎么和它对话

不要把它当成普通笔记工具。把它当成你最严厉的 LLM 理论助教，在 Codex 中直接喊话：

```text
帮我把刚才关于 speculative decoding acceptance 概率的困惑整理进 wiki。
把刚才那个 draft-token 符号用错的记录保存到 correction 里。
用 question-grown-review 帮我复习一下这周的疑惑。
把这个 beam-search 错误和我之前记过的 token-selection 困惑连接起来。
用 question-grown-lint 跑一遍我的库，看看有没有哪些概念页面变成废话百科了。
```

## Vault Contract

你的库会保持一套很硬的结构，并由 Codex 强制遵守：

```text
questions/        # 那些让你疑惑的瞬间
corrections/      # 被 Codex 指出的客观事实
concepts/         # 最小支撑概念而不是百科
derivations/      # 细节的公式推导
misconceptions/   # 长期反复发作的错误直觉
bridges/          # 知识点之间的关键连接
reviews/          # 复盘时的心路历程
sources/          # 明确引用过的参考源
_raw/             # 还没来得及消化的碎片
_meta/            # 模板和维护文件
index.md          # 目录
map.md            # 你的理解地图
gaps.md           # 理解盲区
review.md         # 待复盘队列
log.md            # 操作日志
hot.md            # 最近在做什么
```

## 它绝对不是什么

它不是：

- 通用 LLM 理论百科：想看百科，请看论文、教材或维基。
- 你的泛用 second brain：它不会帮你无脑囤积信息。
- 论文高亮提取器：它只归档“你的认知”，不归档“世界的知识”。
- 精美笔记生产器：漂亮不是目标，修复理解才是目标。

它是一套带偏见的系统：把你的困惑逼到台前，把你的错题留在现场，把你的理解一寸一寸压实。

## 隐私与发布卫生

你的真实 vault 默认应该是私有的。下面这些本地目录不要上传 GitHub：

```text
vault/
references/
upstream/
```

公开仓库应该只发布 skill 集、脚本、文档和空模板。不要发布你的真实 Obsidian 笔记、
克隆的参考项目、聊天记录导出或本地配置文件。

## License

MIT. 见 [LICENSE](LICENSE) 和 [NOTICE.md](NOTICE.md)。

## 参考与影响

本项目基于 `Ar9av/obsidian-wiki` 的模式，并吸收了这些项目的思想：

- `incremental-zettelkasten`: questions as review units
- `joshylchen/zettelkasten`: Capture -> Explain -> Question -> Refine -> Connect
- `arturseo-geo/llm-knowledge-base`: gaps、review queues、learning-layer maintenance
