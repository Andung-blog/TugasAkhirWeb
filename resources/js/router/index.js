import { createRouter, createWebHistory } from "vue-router";
import Trending from "../components/Trending.vue";
import MoviesList from "../components/MovieList.vue"; // Import MoviesList component
import PeopleList from "../components/PeopleList.vue"; // Import PeopleList component
import People from "../components/People.vue";
import About from "../components/About.vue";
import ContactUs from "../components/ContactUs.vue";
import SupportForums from "../components/SupportForums.vue";
import ContactList from "../components/ContactList.vue";
import ContributionGuide from "../components/ContributionGuide.vue";
import Guidelines from "../components/Guidelines.vue";

// Import newly created components
import TermsOfUse from "../components/TermsOfUse.vue";
import APITermsOfUse from "../components/ApiTermsOfUse.vue";
import PrivacyPolicy from "../components/PrivacyPolicy.vue";
import DMCAPolicy from "../components/DMCAPolicy.vue";

import MovieDetail from "../components/MovieDetail.vue";
import TicketManager from "../components/TicketManager.vue";
import TicketList from "../components/TicketList.vue";

const routes = [
    {
        path: "/",
        component: Trending,
    },
    {
        path: "/movies-list",
        component: MoviesList, // Add route for Movies List page
    },
    {
        path: "/people-list",
        component: PeopleList, // Add route for People List page
    },
    {
        path: "/people",
        component: People,
    },
    {
        path: "/about",
        component: About,
    },
    {
        path: "/contact-us",
        component: ContactUs,
    },
    {
        path: "/support-forums",
        component: SupportForums,
    },
    {
        path: "/contact-list",
        component: ContactList,
    },
    {
        path: "/contribution-guide",
        component: ContributionGuide,
    },
    {
        path: "/guidelines",
        component: Guidelines,
    },
    // New routes
    {
        path: "/terms-of-use",
        component: TermsOfUse,
    },
    {
        path: "/api-terms-of-use",
        component: APITermsOfUse,
    },
    {
        path: "/privacy-policy",
        component: PrivacyPolicy,
    },
    {
        path: "/dmca-policy",
        component: DMCAPolicy,
    },
    {
        path: "/movie/:id",
        component: MovieDetail,
    },
    {
        path: "/book-ticket/:id",
        component: TicketManager,
    },
    {
        path: "/ticket-list",
        component: TicketList,
    },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;
