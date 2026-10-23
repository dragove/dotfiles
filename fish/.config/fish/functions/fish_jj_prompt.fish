# 覆盖 fish 内置的 fish_jj_prompt。
# 内置版本在 jj 仓库存在时，即使模板没有任何输出也会返回 0，
# fish_vcs_prompt 的 or 链因此跳过 fish_git_prompt，prompt 不再显示 git 分支。
# 此处改为：jj 没有实际内容可显示时返回 1，让 git prompt 继续生效。
function fish_jj_prompt
    if not command -sq jj
        return 1
    end
    set -l info "$(
        jj log </dev/null 2>/dev/null --no-graph --ignore-working-copy --color=always --revisions @ --template '
                separate(" ",
                    if(conflict, label("conflict", "×")),
                )
            '
    )"
    or return 1
    set -l trimmed (string trim -- "$info")
    if test -n "$trimmed"
        printf ' %s' $info
        return 0
    end
    return 1
end

