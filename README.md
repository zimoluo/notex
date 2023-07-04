`notex.cls` defines a series of behavior based on the `amsart` class.

* Sections, Subsections, and Subsubsections are now Chapters, Modules, and Topics.
* * They can be customized using `\headertitle{}`, `\subheadertitle{}`, and `\subsubheadertitle{}`.
* Builtin environment for Problem, Theorem, Lemma, Corollary, Definition, and more.
* Revamped `proof` environment to use a box similar to theorem and lemma. The old `proof` environment provided by `amsart` can be accessed by `legacyproof`.
* `\title` is not necessarily defined. Instead, a variable named `lecture` gives you the option to directly input the information of the lecture. The title will then be automatically formulated as `Lecture #{lecture}`.
* Provides some shortcut to mathematical environments like `\floor{}`.
* Try out `\NoTeX` and `\RossTeX`!
* Has an extra option named `rosstex`.
  * Activated using `[rosstex]` option.
    * `\lecture` will now denote the number of the problem set, making the title `Problem Set ${}`. Additionally, `\psetnum` command will be available as an alias to `\lecture`.
  * Redefines Sections to Problems.
  * Redefines Subsections and Subsubsections resembling those in `amsart` class.
  * Has an optional Ross Program logo enabled using `\enablerosslogo`.
