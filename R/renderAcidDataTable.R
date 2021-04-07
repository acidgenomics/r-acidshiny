#' Render table output with the JavaScript library DataTables using DT
#'
#' @note Updated 2021-04-07.
#' @export
#'
#' @param expr `data.frame`.
#'
#' @examples
#' data(mtcars, package = "datasets")
#'
#' if (interactive()) {
#'     expr <- mtcars
#'     x <- renderAcidDataTable(expr)
#'     class(x)
#' }
renderAcidDataTable <- function(expr) {
    renderDataTable(
        expr = eval(expr),
        ## This is highly recommended for large data frames.
        server = TRUE,
        ## Need to pass this through, otherwise won't pick up parent correctly.
        ## > env = parent.frame(),
        ## Ensure we pass the expr in directly, without quoting.
        quoted = FALSE,
        ## A list of initialization options.
        ## See "https://datatables.net/reference/option/" for details.
        options = list(
            paging = TRUE,
            pageLength = 50L,
            # Allow user to scroll wide tables horizontally.
            scrollX = TRUE
        ),
        ## Additional arguments passed to `datatable()`:
        ## CSS styling.
        ## See "https://datatables.net/manual/styling/classes" for details.
        class = "display nowrap compact",
        ## Where to position the column filters.
        filter = "top"
    )
}
