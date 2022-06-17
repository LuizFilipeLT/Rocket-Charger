package rocket.charger

class UtilsTagLib {

    static namespace = "utilsTagLib"
    static returnObjectForTags = ["header"]

    def header = { attrs ->
       out << render(template: "/utils/header")
    }
}