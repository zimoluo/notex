`notex.cls` defines a series of behavior based on the `amsart` class.

* Sections, Subsections, and Subsubsections are now Chapters, Modules, and Topics.
* * They can be redefined using `\headertitle{}`, `\subheadertitle{}`, and `\subsubheadertitle{}`.
* Builtin environment for Problem, Theorem, Lemma, Corollary, Definition, and more.
* Revamped `proof` environment to use a box similar to theorem and lemma. The old `proof` environment provided by `amsart` can be accessed by `legacyproof`.
* `\title` is not necessarily defined. Instead, a variable named `lecture` gives you the option to directly input the information of the lecture. The title will then be automatically formulated as `Lecture #{lecture}`.
