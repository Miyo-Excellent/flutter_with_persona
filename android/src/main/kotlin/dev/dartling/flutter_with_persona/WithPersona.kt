package dev.dartling.flutter_with_persona

import androidx.activity.ComponentActivity
import androidx.activity.result.ActivityResultLauncher
import com.withpersona.sdk2.inquiry.*
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/* It's a class that receives the arguments from the Flutter side, and then it launches the Persona
flow */
class WithPersona(private val activity: ComponentActivity) {
    /* It's the name of the method that will be called from the Flutter side. */
    private val methodName = "flutter_with_persona"

    /* It's a variable that receives the value of the `isProduction` argument from the Flutter side. */
    private var isProduction: Boolean = false

    /* It's a variable that receives the value of the `fields` argument from the Flutter side. */
    private var data: Map<String, Any> = mapOf()

    /* It's a variable that receives the value of the `fields` argument from the Flutter side. */
    private var arguments: List<Map<String, Any>> = listOf()

    /* It's a variable that receives the value of the `templateId` argument from the Flutter side. */
    private var templateId: String = ""

    /* It's a variable that receives the value of the `name` argument from the Flutter side. */
    private var name: String = ""

    /* It's a variable that receives the value of the `lastName` argument from the Flutter side. */
    private var lastName: String = ""

    /**
     * It receives the arguments from the Flutter side and creates an Inquiry object.
     *
     * @param call MethodCall, result: MethodChannel.Result
     * @param result MethodChannel.Result
     */
    fun runMethodChannel(call: MethodCall, result: MethodChannel.Result) {
        /* It's receiving the arguments from the Flutter side and creating an Inquiry object. */
        if (call.method == methodName) {
            /* It's receiving the arguments from the Flutter side and creating an Inquiry object. */
            arguments =
                call.arguments as List<Map<String, Any>>
            /// Environment
            /* It's receiving the value of the `isProduction` argument from the Flutter side. */
            isProduction = (arguments[0]["isProduction"] as Boolean?) ?: false
            /// Data params
            /* It's receiving the value of the `fields` argument from the Flutter side. */
            data = arguments[0]["fields"] as Map<String, Any>
            /* It's receiving the value of the `templateId` argument from the Flutter side. */
            templateId = (arguments[0]["templateId"] as String?) ?: ""
            /* It's receiving the value of the `referenceId` argument from the Flutter side. */
            /// Data fields
            /* It's receiving the value of the `name` argument from the Flutter side. */
            name = (data["name"] as String?) ?: ""
            /* It's receiving the value of the `lastName` argument from the Flutter side. */
            lastName = (data["lastName"] as String?) ?: ""

            /* It's receiving the arguments from the Flutter side and creating an Inquiry object. */
            if (templateId.isNotEmpty()) {
                /* It's receiving the value of the `isProduction` argument from the Flutter side and
                creating an `Environment` object. */
                val environment: Environment =
                    if (isProduction) Environment.PRODUCTION else Environment.SANDBOX

                /* It's receiving the arguments from the Flutter side and creating an Inquiry object. */
                val inquiry: Inquiry = inquiry(environment)

                /// launching Persona with the results
                /* It's launching the Persona flow. */
                launcherResult.launch(inquiry)
            }

            /* It's a method that is called when the method name is the same as the one that is being
            called from the Flutter side. */
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else {
            /* It's a method that is called when the method name is not the same as the one that is
            being called from the Flutter side. */
            result.notImplemented()
        }
    }

    /**
     * It builds a Fields object.
     *
     * @param builder Fields.Builder - this is the builder object that will be used to create the
     * Fields object.
     * @return A Fields object
     */
    private fun getFields(builder: Fields.Builder): Fields {
        /* It's checking if the `name` variable is not empty, and if it's not, it's adding the `name`
        variable to the `builder` object. */
        if (name.isNotEmpty()) builder.field("name_first", name)
        /* It's checking if the `lastName` variable is not empty, and if it's not, it's adding the
        `lastName` variable to the `builder` object. */
        if (lastName.isNotEmpty()) builder.field("name_last", lastName)

        /* It's returning the `builder` object. */
        return builder.build()
    }

    /**
     * It's creating an `Inquiry` object
     *
     * @param environment Environment
     * @return An `Inquiry` object.
     */
    private fun inquiry(environment: Environment): Inquiry {
        /* It's creating an `InquiryTemplateBuilder` object. */
        val inquiryTemplate: InquiryTemplateBuilder =
            Inquiry.fromTemplate(templateId)

        /// Persona Fields
        /* It's creating a `Fields.Builder` object. */
        val fieldsBuilder: Fields.Builder = Fields.Builder()

        /* It's creating a `Fields` object. */
        val fields: Fields = getFields(fieldsBuilder)

        /// Persona Template with fields
        /* It's creating an Inquiry object. */
        return inquiryTemplate
            .environment(environment)
            .fields(fields)
            .build()
    }

    /* It's launching the Persona flow. */
    private val launcherResult: ActivityResultLauncher<Inquiry> =
        activity.registerForActivityResult(Inquiry.Contract()) { result ->
            /* It's checking the result of the Persona flow. */
            when (result) {
                /* It's checking if the Persona flow was completed. */
                is InquiryResponse.Complete -> {
                    // ... completed flow
                }
                /* It's checking if the Persona flow was abandoned. */
                is InquiryResponse.Cancel -> {
                    // ... abandoned flow
                }
                /* It's checking if the Persona flow was completed. */
                is InquiryResponse.Error -> {
                    // ... something went wrong
                }
            }
        }
}
